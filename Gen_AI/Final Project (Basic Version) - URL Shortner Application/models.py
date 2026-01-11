from datetime import datetime
from extensions import db

class URLMap(db.Model):
    __tablename__ = 'url_map'

    id = db.Column(db.Integer, primary_key=True)
    original_url = db.Column(db.Text, nullable=False)
    short_code = db.Column(db.String(10), unique=True, nullable=False)
    created_at = db.Column(db.DateTime, default=datetime.utcnow)

    def __repr__(self):
        return f"<URLMap {self.short_code}>"
