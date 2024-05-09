FROM arangodb:3.12

RUN apk add --no-cache rclone bash

COPY entrypoint.sh /entrypoint.sh

RUN chmod +x /entrypoint.sh