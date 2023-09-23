# db_model.py
from sqlalchemy import Column, Integer, String, Date, ForeignKey, Sequence
from sqlalchemy.ext.declarative import declarative_base
from sqlalchemy.orm import relationship

Base = declarative_base()

class UserInfo(Base):
    __tablename__ = 'user_info'
    
    patient_id = Column(String(255), primary_key=True)
    full_name = Column(String(255))
    gender = Column(String(255))
    address = Column(String(255))
    date_of_birth = Column(Date)
    
    medical_histories = relationship("MedicalHistory", backref="user")

class DoctorInfo(Base):
    __tablename__ = 'doctor_info'
    
    license_number = Column(String(255), primary_key=True)
    medical_institution = Column(String(255))
    doctor_name = Column(String(255))
    
    medical_histories = relationship("MedicalHistory", backref="doctor")

class MedicalHistory(Base):
    __tablename__ = 'medical_history'
    
    index = Column(Integer, Sequence('index_seq'), primary_key=True)
    patient_id = Column(String(255), ForeignKey('user_info.patient_id'))
    license_number = Column(String(255), ForeignKey('doctor_info.license_number'))
    diagnosis_code = Column(String(255))
    onset_date = Column(Date)
    diagnosis_date = Column(Date)
    prognosis = Column(Date, nullable=True)
    hospitalization_dates = Column(String(255))

def initialize_db(app):
    from sqlalchemy import create_engine
    from sqlalchemy.orm import scoped_session, sessionmaker

    engine = create_engine(app.config['SQLALCHEMY_DATABASE_URI'])
    db_session = scoped_session(sessionmaker(autocommit=False, autoflush=False, bind=engine))

    Base.query = db_session.query_property()
    Base.metadata.create_all(bind=engine)
