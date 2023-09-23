# app.py
from flask import Flask
from db_model import initialize_db
from api_way import api

app = Flask(__name__)

# SQLAlchemy 설정
app.config['SQLALCHEMY_DATABASE_URI'] = "mysql+pymysql://<username>:<password>@<host>/<dbname>"
app.config['SQLALCHEMY_TRACK_MODIFICATIONS'] = False

initialize_db(app)

app.register_blueprint(api, url_prefix='/api')
if __name__ == "__main__":
    app.run(debug=True)