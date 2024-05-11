# config.py
import os
from dotenv import load_dotenv

dotenv_path = os.path.join(os.path.dirname(__file__), '.env')
if os.path.exists(dotenv_path):
    load_dotenv(dotenv_path)


class Config:
    SQLALCHEMY_TRACK_MODIFICATIONS = False


class DevelopmentConfig(Config):
    ENV = "development"
    DEBUG = True
    # SQLALCHEMY_DATABASE_URI = 'postgresql+psycopg2://postgres3:Mango44@host.docker.internal:5434/order'
    SQLALCHEMY_DATABASE_URI = 'postgresql+psycopg2://postgres3:Mango44@order-db:5434/order'
    SQLALCHEMY_ECHO = True


class ProductionConfig(Config):
    ENV = "production"
    DEBUG = True
    # SQLALCHEMY_DATABASE_URI = 'postgresql+psycopg2://postgres3:Mango44@host.docker.internal:5434/order'
    SQLALCHEMY_DATABASE_URI = 'postgresql+psycopg2://postgres3:Mango44@order-db:5434/order'
    SQLALCHEMY_ECHO = False


