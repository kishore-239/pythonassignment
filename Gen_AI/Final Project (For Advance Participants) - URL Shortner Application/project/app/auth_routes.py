from flask import Blueprint, render_template, request, redirect
from werkzeug.security import generate_password_hash, check_password_hash
from flask_login import login_user, logout_user
from .models import User
from .extensions import db

auth = Blueprint("auth", __name__)

@auth.route("/")
def home():
    return render_template("home.html")

@auth.route("/signup", methods=["GET", "POST"])
def signup():
    if request.method == "POST":
        username = request.form["username"]
        password = request.form["password"]

        if len(username) < 5 or len(username) > 9:
            return "Username must be between 5 to 9 characters long"

        if User.query.filter_by(username=username).first():
            return "This username already exists"

        user = User(
            username=username,
            password=generate_password_hash(password)
        )

        db.session.add(user)
        db.session.commit()
        return redirect("/login")

    return render_template("signup.html")

@auth.route("/login", methods=["GET", "POST"])
def login():
    if request.method == "POST":
        user = User.query.filter_by(username=request.form["username"]).first()

        if user and check_password_hash(user.password, request.form["password"]):
            login_user(user)
            return redirect("/dashboard")

        return "Invalid username or password"

    return render_template("login.html")

@auth.route("/logout")
def logout():
    logout_user()
    return redirect("/")
