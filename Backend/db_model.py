# db_model.py
from sqlalchemy import Column, Integer, String, Date, ForeignKey, Sequence
from sqlalchemy.ext.declarative import declarative_base
from sqlalchemy.orm import relationship

Base = declarative_base()

class UserInfo(Base):
    __tablename__ = 'user_info'
    
    주민등록번호 = Column(String, primary_key=True)
    성명 = Column(String)
    성별 = Column(String)
    주소 = Column(String)
    
    medical_histories = relationship("MedicalHistory", backref="user")

class DoctorInfo(Base):
    __tablename__ = 'doctor_info'
    
    면허번호 = Column(String, primary_key=True)
    의료기관의_명칭 = Column(String)
    성명 = Column(String)
    
    medical_histories = relationship("MedicalHistory", backref="doctor")

class MedicalHistory(Base):
    __tablename__ = 'medical_history'
    
    index = Column(Integer, Sequence('index_seq'), primary_key=True)
    주민등록번호 = Column(String, ForeignKey('user_info.주민등록번호'))
    면허번호 = Column(String, ForeignKey('doctor_info.면허번호'))
    질병분류코드 = Column(String)
    발병일 = Column(Date)
    진단일 = Column(Date)
    향후_치료_소견 = Column(String)
    입퇴원_연월일 = Column(Date, nullable=True)

def initialize_db(app):
    from sqlalchemy import create_engine
    from sqlalchemy.orm import scoped_session, sessionmaker

    engine = create_engine(app.config['SQLALCHEMY_DATABASE_URI'])
    db_session = scoped_session(sessionmaker(autocommit=False, autoflush=False, bind=engine))

    Base.query = db_session.query_property()
    Base.metadata.create_all(bind=engine)
