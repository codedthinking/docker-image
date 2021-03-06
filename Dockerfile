FROM python:3.8
MAINTAINER miklos.koren@gmail.com
RUN cd /usr/bin && curl -sLo bead https://github.com/e3krisztian/bead/releases/download/v0.8.1/bead && chmod +x bead
RUN cd /usr/bin && curl -sLo shellshare https://get.shellshare.net && chmod +x shellshare
RUN apt-get update && apt-get install tree asciinema nano less fish -y
RUN pip install pipenv csvkit
RUN useradd -ms /usr/bin/fish student && usermod -aG sudo student 
USER student 
WORKDIR /home/student
RUN pipenv --python 3.7
CMD ["pipenv", "shell"]