from flask import Flask, request, render_template

app = Flask(__name__)

# Main route
@app.route("/")
def home():
    # Safely get username from URL
    username = request.args.get("username", "")

    # Convert to uppercase
    uppercase_name = username.upper()

    return render_template(
        "index.html",
        name=uppercase_name
    )

# Bonus route: reverse the name
@app.route("/reverse")
def reverse_name():
    username = request.args.get("username", "")
    reversed_name = username[::-1].upper()

    return f"Reversed Name: {reversed_name}"

if __name__ == "__main__":
    app.run(debug=True)
