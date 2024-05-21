# 기본 Python 이미지 사용
FROM python:3.9-slim

# 작업 디렉토리 설정
WORKDIR /app

# 필요 라이브러리 설치
RUN pip install --no-cache-dir paho-mqtt

# 애플리케이션 파일 복사
COPY . /app

# 실행할 스크립트 지정
CMD ["python", "script.py"]
