from flask import Flask, render_template, request, redirect
from urllib.parse import urlparse
import random
import string

from extensions import db

app = Flask(__name__)
app.config.from_object('config')

db.init_app(app)

from models import URLMap

with app.app_context():
    db.create_all()


# ------------------ Utility Functions ------------------

def generate_short_code(length=6):
    characters = string.ascii_letters + string.digits
    return ''.join(random.choice(characters) for _ in range(length))


def is_valid_url(url):
    parsed = urlparse(url)
    return parsed.scheme in ('http', 'https') and parsed.netloc != ''


# ------------------ Routes ------------------

@app.route('/', methods=['GET', 'POST'])
def home():
    if request.method == 'POST':
        original_url = request.form.get('original_url')

        if not is_valid_url(original_url):
            return render_template('home.html', error="Please enter a valid URL")

        short_code = generate_short_code()
        while URLMap.query.filter_by(short_code=short_code).first():
            short_code = generate_short_code()

        new_url = URLMap(original_url=original_url, short_code=short_code)
        db.session.add(new_url)
        db.session.commit()

        short_url = request.host_url + short_code
        return render_template('home.html', short_url=short_url)

    return render_template('home.html')


@app.route('/<short_code>')
def redirect_url(short_code):
    url_entry = URLMap.query.filter_by(short_code=short_code).first()

    if not url_entry:
        return "URL not found", 404

    return redirect(url_entry.original_url)


@app.route('/history')
def history():
    urls = URLMap.query.order_by(URLMap.created_at.desc()).all()
    return render_template('history.html', urls=urls)


if __name__ == '__main__':
    app.run(debug=True)
