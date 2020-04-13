docker build -t app --env-file=.env

docker run -p 8080:8080 --rm -it app:latest