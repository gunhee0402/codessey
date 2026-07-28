FROM nginx:latest

# ./site 폴더 안의 index.html을 정확한 위치로 복사
COPY ./site/index.html /usr/share/nginx/html/index.html

EXPOSE 80