FROM python:3.7

WORKDIR /app

COPY requirements.txt ./requirements.txt
RUN pip install -U pip 
RUN pip install -r ./requirements.txt

#Google Cloud SDK install
RUN echo "deb [signed-by=/usr/share/keyrings/cloud.google.gpg] https://packages.cloud.google.com/apt cloud-sdk main" | tee -a /etc/apt/sources.list.d/google-cloud-sdk.list
RUN apt-get install apt-transport-https ca-certificates -yqq
RUN curl https://packages.cloud.google.com/apt/doc/apt-key.gpg | apt-key --keyring /usr/share/keyrings/cloud.google.gpg add -
RUN apt-get update && apt-get install google-cloud-sdk -yqq

COPY src ./src
COPY start_app.sh ./start_app.sh
RUN chmod +x start_app.sh

EXPOSE 8080

# start the web service
ENTRYPOINT ["/app/start_app.sh"] 