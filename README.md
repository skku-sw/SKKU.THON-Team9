# SKKU.THON Team9

## 프로젝트 개요
- 과거에 비해 이동성이 극적으로 개선된 오늘날과 같이 자신의 본고장과 다른 도시나 국가에서 살게 되는 경우가 흔합니다. 이때, 기존에 자신이 가던 병원을 가야만 마음이 편한데 그러지 못하는 경우가 자주 있습니다. 상황이 이렇다 보니, 마음 한 편이 찝찝한 채로 새 병원을 방문하거나 진료 시기를 늦춰가며 병원 방문 기간을 늦추는 일이 빈번하게 발생합니다. 사람들의 이러한 고충을 조금이나마 해소하는 데 도움이 되고자 '역대 진단 결과 공유 서비스'를 제작하였습니다.

## 프로젝트에서 사용한 기술
- **Frontend**:
  - [Next.js](https://nextjs.org/)
  - [React.js](https://react.dev/)

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

  - [Vercel](https://vercel.com/)
    - [Github](https://github.com/)

## Dev Server 실행 방법
### Frontend
1. ```bash
   git clone https://github.com/skku-sw/SKKU.THON-Team9.git
   ```
3. ```bash
   cd SKKU.THON-Team9/skkuthon-team-9
   ```
4. Frontend 작업 폴더로 들어가 프로젝트에 필요한 packages 다운로드
  ```bash
  npm install
  ```
4. .env 파일 작성
5. 개발 서버 실행
   ```bash
   npm run dev
   ```

### Baclemd
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
