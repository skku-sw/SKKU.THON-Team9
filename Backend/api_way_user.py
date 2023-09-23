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
from flask_jwt_extended import create_access_token, jwt_required, get_jwt_identity
from werkzeug.security import check_password_hash
from request_model import login_request_model, register_request_model

# 다른 필요한 모듈 임포트

user_api = Blueprint("user_api", __name__)


@user_api.route("/login", methods=["GET", "POST"])
def login():
    try:
        if request.method == "POST":
            data = request.get_json()
            # 입력받은 데이터 유효성 검사
            if not all(field in data for field in login_request_model):
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


@user_api.route("/register", methods=["GET", "POST"])
def register():
    try:
        if request.method == "POST":
            data = request.get_json()

            # 입력받은 데이터 유효성 검사
            if not all(field in data for field in register_request_model):
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
            return jsonify(to_dict(new_user)), 200
        else:
            return jsonify({"msg": "Invalid Route, Please Try Again."}), 404
    except Exception as e:
        return jsonify(f"msg: {e}")


@user_api.route("/delete", methods=["POST", "GET"])
@jwt_required()
def delete_account():
    try:
        # 현재 로그인된 사용자의 ID를 가져옵니다.
        current_user_id = get_jwt_identity()
        user = UserInfo.query.filter_by(patient_id=current_user_id).first()

        # 유저가 존재하지 않는 경우
        if not user:
            return jsonify({"msg": "User not found."}), 404

        # 유저 정보 삭제
        from app import db_session

        db_session.delete(user)
        db_session.commit()

        return jsonify({"msg": "User Deleted Successfully"}), 200
    except Exception as e:
        return jsonify(f"msg: {e}")


@user_api.route("/get_list", methods=["GET", "POST"])
def get_list():
    try:
        if request.method == "GET":
            # 모든 사용자 정보를 조회
            users = UserInfo.query.all()
            users_list = [to_dict(user) for user in users]
            return jsonify(users_list), 200

        else:
            return jsonify({"msg": "Invalid Route, Please Try Again."}), 404
    except Exception as e:
        return jsonify(f"msg: {e}")


@user_api.route("/logout")
def logout():
    session.pop("logged_in", None)
    session.pop("patient_id", None)
    return "Successful", 200


@user_api.route("/home", methods=["GET"])
def some_function():
    return jsonify("Hello")
