# app.py
from flask import Flask
from db_model import initialize_db
from api_way import api

app = Flask(__name__)

# SQLAlchemy 설정
app.config['SQLALCHEMY_DATABASE_URI'] = "mysql+pymysql://kimdozz0:1987qpzx!@project.c9zirfty1roz.ap-northeast-2.rds.amazonaws.com:3306/My_database"
app.config['SQLALCHEMY_TRACK_MODIFICATIONS'] = False

initialize_db(app)

app.register_blueprint(api, url_prefix='/api')
if __name__ == "__main__":
    app.run(debug=True)