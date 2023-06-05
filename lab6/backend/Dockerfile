FROM python:3.10-alpine
WORKDIR /backend
ADD requirements.txt .
RUN pip install -r requirements.txt
COPY app.py mongo_functions.py ./
EXPOSE 5000
CMD ["python3", "app.py"]
