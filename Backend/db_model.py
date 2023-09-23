# db_model.py
from sqlalchemy import Column, Integer, String, Date, ForeignKey, Sequence
from sqlalchemy.ext.declarative import declarative_base
from sqlalchemy.orm import relationship
from werkzeug.security import generate_password_hash, check_password_hash

Base = declarative_base()


class UserInfo(Base):
    __tablename__ = "user_info"

    patient_id = Column(String(255), primary_key=True)

    full_name = Column(String(255))
    gender = Column(String(255))
    address = Column(String(255))
    date_of_birth = Column(Date)
    hashed_password = Column(String(255))

    medical_histories = relationship("MedicalHistory", backref="user")

    def set_password(self, password):
        self.hashed_password = generate_password_hash(password)

    def check_password(self, password):
        return check_password_hash(self.hashed_password, password)


class DoctorInfo(Base):
    __tablename__ = "doctor_info"

    license_number = Column(String(255), primary_key=True)
    medical_institution = Column(String(255))
    doctor_name = Column(String(255))

    medical_histories = relationship("MedicalHistory", backref="doctor")


class MedicalHistory(Base):
    __tablename__ = "medical_history"

    index = Column(Integer, primary_key=True,autoincrement=True)
    patient_id = Column(String(255), ForeignKey("user_info.patient_id"))
    license_number = Column(String(255), ForeignKey("doctor_info.license_number"))
    diagnosis_code = Column(String(255))
    onset_date = Column(Date) # 발병일
    diagnosis_date = Column(Date) #진단일
    prognosis = Column(Date, nullable=True) # 진단내용
    hospitalization_dates = Column(Date) #입원일
    filename = Column(String(255)) #의료 pdf


def initialize_db(app):
    from sqlalchemy import create_engine
    from sqlalchemy.orm import scoped_session, sessionmaker

    engine = create_engine(app.config["SQLALCHEMY_DATABASE_URI"])
    db_session = scoped_session(
        sessionmaker(autocommit=False, autoflush=False, bind=engine)
    )

    Base.query = db_session.query_property()
    Base.metadata.create_all(bind=engine)
    return db_session


def to_dict(model_instance, query_instance=None):
    if hasattr(model_instance, "__table__"):
        return {
            c.name: getattr(model_instance, c.name)
            for c in model_instance.__table__.columns
        }
    else:
        cols = query_instance.column_descriptions
        return {cols[i]["name"]: model_instance[i] for i in range(len(cols))}
