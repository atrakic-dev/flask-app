FROM alpine:latest

RUN apk add --update --no-cache python3 \
  && python3 -m ensurepip \
  && pip3 install --upgrade pip && rm -rf /var/cache/apk/*

COPY requirements.txt /usr/src/app/
RUN pip3 install --no-cache-dir -r /usr/src/app/requirements.txt

COPY src/app.py /usr/src/app/
COPY src/templates/index.html /usr/src/app/templates/

EXPOSE 5000

CMD ["python3", "/usr/src/app/app.py"]
