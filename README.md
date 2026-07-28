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

#### 1. 터미널 기본 명령어 실습 및 Git 초기 설정
- 터미널에서 디렉토리를 생성하고 파일 권한을 변경하는 기초 실습을 진행했습니다.
- 로컬 저장소를 초기화하고 GitHub 원격 저장소와 연결했습니다.

```bash
# 터미널 실습 및 파일 생성
$ pwd
$ ls -la
$ mkdir codyssey-mission
$ cd codyssey-mission
$ touch test.txt
$ chmod +x test.txt

# Git 설정 및 첫 커밋
$ git config --global user.name "jeong gunhee"
$ git config --global user.email "jkhlms3587333@gmail.com"
$ git init
$ git add test.txt
$ git commit -m "첫 번째 커밋: 터미널 실습 파일 추가"
$ git branch -M main
$ git remote add origin https://github.com/gunhee0402/codessey.git
$ git push -u origin main -f

Docker 환경 구축 및 웹 서버 실행
-Dockerfile을 작성하여 Nginx 기반의 커스텀 이미지를 빌드했습니다.
컨테이너를 실행하여 브라우저(localhost:8080)에서 접속을 확인했습니다.
# 프로젝트 구조 생성
$ mkdir site
$ touch site/index.html  # VS Code에서 "Hello Codyssey!" 작성
$ touch Dockerfile       # Nginx 설정 및 파일 복사 명령어 작성

# Docker 이미지 빌드
$ docker build -t my-web-server .

# 컨테이너 실행 (포트 8080 매핑)
$ docker run -d -p 8080:80 --name my-web my-web-server

볼륨 마운트(Volume Mount) 적용 및 실시간 반영
컨테이너를 삭제한 후, 로컬의 소스 코드와 컨테이너 내부를 연결하는 볼륨 마운트를 적용했습니다.
이를 통해 이미지 재빌드 없이 소스 수정 사항이 즉시 반영됨을 확인했습니다.
# 기존 컨테이너 중지 및 삭제
$ docker stop my-web
$ docker rm my-web

# 볼륨 마운트 옵션(-v)을 사용하여 재실행
$ docker run -d -p 8080:80 --name my-web -v $(pwd)/site:/usr/share/nginx/html my-web-server

# 최종 결과 확인 후 Git 푸시
$ git add .
$ git commit -m "Final: Docker web server setup with volume mount"
$ git push origin main

### [1] 터미널 기초 및 권한 변경
$ ls -al
$ chmod +x test.txt
$ ls -al test.txt  # 권한 변경 확인

### [2] Docker 웹 서버 실행
$ docker build -t my-web-server .
$ docker run -d -p 8080:80 --name my-web my-web-server
