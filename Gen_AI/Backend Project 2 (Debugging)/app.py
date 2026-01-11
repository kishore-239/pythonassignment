from flask import Flask, render_template, request

app = Flask(__name__)

# This list stores notes temporarily (in memory)
notes = []

@app.route('/', methods=['GET', 'POST'])
def index():
    if request.method == 'POST':
        # Get note from the form
        note = request.form.get('note')

        # Add note only if it is not empty
        if note:
            notes.append(note)

    # Always show the page with notes
    return render_template('home.html', notes=notes)


if __name__ == '__main__':
    app.run(debug=True)
