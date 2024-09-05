FROM python:3.10.14
WORKDIR /opt
COPY modules.txt modules.txt
RUN pip install -r modules.txt
EXPOSE 5000
COPY . .
ENTRYPOINT ["flask", "run"]