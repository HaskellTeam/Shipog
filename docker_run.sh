# -it <command> Ex.: -it bash
# -v <project dir>:<container dir> -w <container dir>
# ubuntu:prolog <image name>:<image tag>
#
docker run -it -v "$PWD":"/code" -w "/code" ubuntu:prolog bash