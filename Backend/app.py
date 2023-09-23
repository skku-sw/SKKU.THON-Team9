# app.py
from flask import Flask
from db_model import initialize_db
from api_way_user import user_api
from api_way_pdf import pdf_api
from flask_jwt_extended import JWTManager

app = Flask(__name__)

# SQLAlchemy 설정
app.config[
    "SQLALCHEMY_DATABASE_URI"
] = "mysql+pymysql://kimdozz0:1987qpzx!@project.c9zirfty1roz.ap-northeast-2.rds.amazonaws.com:3306/My_database"
app.config["SQLALCHEMY_TRACK_MODIFICATIONS"] = False
app.config["JWT_SECRET_KEY"] = "SKKUTHON"
jwt = JWTManager(app)

db_session = initialize_db(app)

app.register_blueprint(user_api, url_prefix="/user")
app.register_blueprint(pdf_api, url_prefix="/pdf")

if __name__ == "__main__":
    app.run(debug=True, host="0.0.0.0", port=8080)
