FROM python:3.5
RUN apt-get update && apt-get install python3 -y
COPY . /frontend
EXPOSE 5000
ENTRYPOINT ["/usr/local/bin/python3", "app.py"]
