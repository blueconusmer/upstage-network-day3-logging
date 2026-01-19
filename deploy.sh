#!/bin/bash

echo "1. 프로젝트 폴더로 이동"
cd ~/workspace/upstage-network-day3-logging

echo "2. 최신 코드 pull"
git pull origin main

echo "3. 기존 uvicorn 프로세스 종료"
# uvicorn이 실행 중이면 해당 프로세스 번호(PID)를 찾아 종료합니다.
pkill -f uvicorn

echo "4. 서버 백그라운드 실행"
# 우리가 만든 가상환경(.venv)의 python을 사용하도록 경로를 지정합니다.
nohup ./.venv/bin/python3 -m uvicorn main:app --host 0.0.0.0 --port 8000 \
  > /dev/null 2>&1 < /dev/null &

echo "배포 완료!"
