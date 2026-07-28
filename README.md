#  개발 워크스테이션 구축 및 Docker 실습 미션

## 1) 실행 환경
- **OS:** macOS
- **Shell:** zsh
- **Container:** Docker (OrbStack) - 버전 28.5.2
- **Editor:** Visual Studio Code
- **Git:** (git version 2.55.0)

## 1) 실행 방법
### 1. 이미지 빌드
docker build -t my-web-server .

### 2. 컨테이너 실행
docker run -d -p 8080:80 --name my-web my-web-server

### 3. 접속 주소
http://localhost:8080


## 2) 수행 체크리스트
- [x] 터미널 기본 조작 및 폴더 구성
- [x] 권한 변경 실습
- [x] Docker 설치/점검
- [x] hello-world 실행
- [x] Dockerfile 빌드/실행
- [x] 포트 매핑 접속(2회)
- [x] 바인드 마운트 반영
- [x] 볼륨 영속성
- [x] Git 설정 + VSCode GitHub 연동

## 3) 수행 로그 및 증거 자료

### [1] 터미널 기초 및 권한 변경
$ ls -al
$ chmod +x test.txt
$ ls -al test.txt  # 권한 변경 확인

### [2] Docker 웹 서버 실행
$ docker build -t my-web-server .
$ docker run -d -p 8080:80 --name my-web my-web-server
