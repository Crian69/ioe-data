FROM python:3.10-slim-buster

#Set the working directory
WORKDIR /

#copy all the files
COPY . .

RUN pip install pipenv

#Install the dependencies
RUN apt-get -y update
RUN apt-get update && apt-get install -y python3 python3-pip

RUN pipenv lock -r > requirements.txt
RUN pip install -r requirements.txt
RUN apt autoremove -y

#Expose the required port
EXPOSE 5000

#Run the command
CMD gunicorn main:app