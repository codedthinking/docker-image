docker run -it \
  --mount type=bind,source="$(pwd)/volume",target=/home/student \
  codedthinking/student:latest "/bin/bash"