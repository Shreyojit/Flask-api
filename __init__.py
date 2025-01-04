# __init__.py

from flask import Flask
from flask_migrate import Migrate
from flask_sqlalchemy import SQLAlchemy
from dotenv import load_dotenv

import os

load_dotenv()  # Load environment variables from .env

# Initialize Flask app and db
app = Flask(__name__)
db = SQLAlchemy()

# Configure the app with database URL
app.config["SQLALCHEMY_DATABASE_URI"] = os.getenv("DATABASE_URL")
app.config["SQLALCHEMY_TRACK_MODIFICATIONS"] = False

# Initialize db with app
db.init_app(app)

migrate = Migrate(app, db)

# Ensure app context for db creation
with app.app_context():
    db.create_all()

# Register blueprints or routes here
# from your_module import your_blueprint
