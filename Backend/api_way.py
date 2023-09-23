# api_way.py
from flask import (
    Blueprint,
    jsonify,
    request,
    session,
    redirect,
    url_for,
    render_template_string,
)
from db_model import UserInfo, to_dict
from flask_jwt_extended import create_access_token, jwt_required
from werkzeug.security import check_password_hash

# 다른 필요한 모듈 임포트

api = Blueprint("api", __name__)


@api.route("/login", methods=["GET", "POST"])
def login():
    try:
        if request.method == "POST":
            data = request.get_json()
            # 입력받은 데이터 유효성 검사
            if not all(
                field in data
                for field in (
                    "patient_id",
                    "password",
                )
            ):
                return jsonify({"msg": "Missing or invalid data."}), 400

            user = UserInfo.query.filter_by(patient_id=data["patient_id"]).first()
            if user and user.check_password(data["password"]):
                access_token = create_access_token(identity=data["patient_id"])
                return jsonify(access_token=access_token), 200
            else:
                return jsonify({"msg": "Invalid Credentials, Please Try Again."}), 401
        else:
            return jsonify({"msg": "Invalid Route, Please Try Again."}), 404
    except Exception as e:
        return jsonify(f"msg: {e}")


@api.route("/register", methods=["GET", "POST"])
def register():
    try:
        if request.method == "POST":
            data = request.get_json()

            # 입력받은 데이터 유효성 검사
            if not all(
                field in data
                for field in (
                    "patient_id",
                    "full_name",
                    "gender",
                    "address",
                    "date_of_birth",
                    "password",
                )
            ):
                return jsonify({"msg": "Missing or invalid data."}), 400

            # 주민등록번호로 사용자가 이미 등록되어 있는지 확인
            existing_user = UserInfo.query.filter_by(
                patient_id=data["patient_id"]
            ).first()
            if existing_user:
                return (
                    jsonify({"msg": "User with the given patient_id already exists."}),
                    409,
                )

            # 새 사용자 객체 생성
            new_user = UserInfo(
                patient_id=data["patient_id"],
                full_name=data["full_name"],
                gender=data["gender"],
                address=data["address"],
                date_of_birth=data["date_of_birth"],
            )
            new_user.set_password(data["password"])
            from app import db_session

            db_session.add(new_user)
            db_session.commit()
            return jsonify(new_user), 200
        else:
            return jsonify({"msg": "Invalid Route, Please Try Again."}), 404
    except Exception as e:
        return jsonify(f"msg: {e}")


@api.route("/logout")
def logout():
    session.pop("logged_in", None)
    session.pop("patient_id", None)
    return "Successful", 200


@api.route("/home", methods=["GET"])
def some_function():
    return jsonify("Hello")
