FROM python:3.8
MAINTAINER miklos.koren@gmail.com
RUN cd /usr/bin && curl -sLo bead https://github.com/e3krisztian/bead/releases/download/v0.8.1/bead && chmod +x bead
RUN apt-get update && apt-get install tree -y
RUN pip install pipenv csvkit
RUN useradd -ms /bin/bash student && usermod -aG sudo student 
USER student 
WORKDIR /home/student
RUN pipenv --python 3.7
SHELL ["/bin/bash"]
CMD ["pipenv", "shell"]