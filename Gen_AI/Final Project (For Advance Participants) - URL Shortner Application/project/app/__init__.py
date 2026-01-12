from flask import Flask
from .extensions import db, login_manager
from .models import User

def create_app():
    app = Flask(__name__)

    app.config["SECRET_KEY"] = "change-this-secret"
    app.config["SQLALCHEMY_DATABASE_URI"] = "sqlite:///app.db"
    app.config["SQLALCHEMY_TRACK_MODIFICATIONS"] = False

    db.init_app(app)
    login_manager.init_app(app)

    from .auth_routes import auth
    from .url_routes import urls

    app.register_blueprint(auth)
    app.register_blueprint(urls)

    with app.app_context():
        db.create_all()

    @login_manager.user_loader
    def load_user(user_id):
        return User.query.get(int(user_id))

    return app
