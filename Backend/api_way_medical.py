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

medical_api = Blueprint("medical_api", __name__)


@medical_api.route("/check_list", methods=["GET", "POST"])
def check_list():
    try:
        pass
    except Exception as e:
        return jsonify({"msg": str(e)}), 400
