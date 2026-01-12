from flask import Blueprint, render_template, request, redirect
from flask_login import login_required, current_user
from .models import ShortURL
from .extensions import db
import random
import string

urls = Blueprint("urls", __name__)

def generate_code():
    return "".join(random.choices(string.ascii_letters + string.digits, k=6))

@urls.route("/dashboard", methods=["GET", "POST"])
@login_required
def dashboard():
    if request.method == "POST":
        # ✅ Empty URL validation (added safely)
        if not request.form["url"]:
            return "URL cannot be empty"

        short = ShortURL(
            original_url=request.form["url"],
            short_code=generate_code(),
            user_id=current_user.id
        )
        db.session.add(short)
        db.session.commit()

    data = ShortURL.query.filter_by(user_id=current_user.id).all()
    return render_template("dashboard.html", urls=data)

@urls.route("/<short_code>")
def redirect_short_url(short_code):
    link = ShortURL.query.filter_by(short_code=short_code).first()

    if link:
        return redirect(link.original_url)

    return "Invalid short URL"
