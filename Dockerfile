#####
#
# To build:
#  docker build -t reg.k8s.rf.io/rf/yy/containerized-python-quickstart . && docker push reg.k8s.rf.io/rf/yy/containerized-python-quickstart
# To run:
#   docker run -t -i reg.k8s.rf.io/rf/yy/containerized-python-quickstart
#
#####
# set base image (host OS)
FROM python:3.8

# set the working directory in the container
WORKDIR /code

ENV FLASK_APP=hello
ENV FLASK_ENV=development

# copy the dependencies file to the working directory
COPY requirements.txt .

# install dependencies
RUN pip install -i https://mirrors.bfsu.edu.cn/pypi/web/simple -r requirements.txt

# copy the content of the local src directory to the working directory
COPY src/ .

# command to run on container start
# https://flask.palletsprojects.com/en/2.1.x/quickstart/#a-minimal-application
CMD [ "flask", "run", "--host=0.0.0.0" ]