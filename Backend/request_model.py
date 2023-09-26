login_request_model = (
    "patient_id",
    "password",
)

register_request_model = (
    "patient_id",
    "full_name",
    "gender",
    "address",
    "date_of_birth",
    "password",
)

upload_request_model = (
    "license_number",
    "medical_institution",
    "doctor_name",
    "patient_id",
    "diagnosis_code",
    "onset_date",
    "diagnosis_date",
    "prognosis",
    "hospitalization_dates",
)

aws_access_key_id = ""  # 액세스 키 ID
aws_secret_access_key = ""  # 비밀 액세스 키
region_name = "ap-northeast-2"
s3_bucket_name = "deep-plant-image"
image_path = "https://deep-plant-image.s3." + region_name + ".amazonaws.com/"
