FROM python:3.9.2-slim-buster
# Create /data directory with necessary permissions
RUN mkdir /data && chmod 777 /data
RUN mkdir /app && chmod 777 /app
WORKDIR /app
ENV DEBIAN_FRONTEND=noninteractive
RUN apt -qq update && apt -qq install -y git python3 python3-pip ffmpeg
COPY . .
RUN pip3 install --no-cache-dir -r requirements.txt
CMD ["bash","bash.sh"]
