# SKKU.THON Team9

레포지토리 설명

다음과 같은 기능이 포함되어 있습니다.

- 기능

## 프로젝트에서 사용한 기술
- **Backend**:
  - [Flask](https://flask.palletsprojects.com/)
  - [MySQL](https://www.mysql.com/)
  
- **Design**:
  - [Figma](https://www.figma.com/)
  
- **Version Control**:
  - [Git](https://git-scm.com/)

- **Deployment & Cloud**:
  - [AWS](https://aws.amazon.com/)
    - [EC2](https://aws.amazon.com/ec2/)
    - [S3](https://aws.amazon.com/s3/)
    - [RDS](https://aws.amazon.com/rds/)

## Dev Server 실행 방법

1. [로컬 개발 환경 설정 방법, 예: 가상 환경 설정]
   
2. Flask의 내장 서버를 사용하여 개발 서버를 실행:
    ```bash
    flask run
    ```

## Production 배포 방법

1. **코드 최신 버전 가져오기**:
    ```bash
    git pull origin main
    ```

2. **Python 가상 환경 설정**:
    ```bash
    python3 -m venv env
    source env/bin/activate
    ```

3. **필요한 라이브러리 설치**:
    ```bash
    pip install gunicorn flask
    ```

4. **Gunicorn을 통해 Flask 앱 실행**:
    ```bash
    gunicorn --bind 0.0.0.0:5000 app:app
    ```

5. **Systemd 서비스 파일 생성/수정**:
    ```bash
    sudo nano /etc/systemd/system/myflask.service
    ```

   해당 파일 내에 아래와 같은 내용을 작성하거나 수정하세요:
    ```
    [Unit]
    Description=Gunicorn instance to serve my flask app
    After=network.target

    [Service]
    User=[유저명]
    Group=www-data
    WorkingDirectory=[작업 디렉토리]
    Environment="PATH=[작업 디렉토리]/env/bin"
    ExecStart=[작업 디렉토리]/env/bin/gunicorn --workers 3 --bind 0.0.0.0:5000 app:app

    [Install]
    WantedBy=multi-user.target
    ```

6. **Systemd 서비스 시작**:
    ```bash
    sudo systemctl start myflask
    ```

7. (선택 사항) 서비스가 부팅 시에도 자동으로 시작하도록 설정하려면:
    ```bash
    sudo systemctl enable myflask
    ```

## 환경 변수 및 시크릿
- GitHub Actions에서는 **Secrets repository**를 사용하여 중요한 환경 변수를 안전하게 저장하였습니다.
- AWS의 중요한 정보, 예를 들어 엑세스 키나 ID는 AWS **Secrets Manager**를 통해 저장하고 관리하였습니다.

## 기타

## Local Server 실행 방법

1. Docker 설치

2. Repository Clone

3. Dockerfile Image build

   ```bash

   cd  SKKU.THON Team9

   docker  build  -t  flask-app  .

   ```

4. Docker container run

   ```bash

   docker  run  -p  8080:5000  flask-app

   ```

5. Local Server 접속

   - https://localhosts:8080
