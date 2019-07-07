FROM geodata/gdal:2.1.3

USER root

ADD ./requirements.txt .

RUN apt-get update

RUN apt-get install -y -q libspatialindex-dev unar bc

RUN apt-get upgrade -y -q

RUN apt-get clean

RUN pip install --upgrade pip

RUN pip install --upgrade setuptools

RUN pip install -r requirements.txt

RUN mkdir /code

ADD . /code/

WORKDIR /code

CMD python server.py

EXPOSE 10000
