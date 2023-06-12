FROM python:3.11
# EXPOSE 5000
WORKDIR /app
RUN pip install flask
RUN pip install python-dotenv
COPY requirements.txt .
RUN pip install --no-cache-dir --upgrade -r requirements.txt
COPY . .
COPY .flaskenv ./
# CMD ["flask", "run", "--host", "0.0.0.0"]
# CMD ["gunicorn", "--bind", "0.0.0.0:80", "app:create_app()"]
CMD ["/bin/bash", "docker-entrypoint.sh"]