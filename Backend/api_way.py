# api_way.py
from flask import Blueprint, jsonify

# 다른 필요한 모듈 임포트

api = Blueprint("api", __name__)


@api.route("/home", methods=["GET"])
def some_function():
    return jsonify("Hello")
