# ArangoDB Backup Container

This container image provides a simple way to backup ArangoDB databases using the `arangodump` and `rclone` tools.

## Usage

To use this container, you will need to provide the following environment variables:

* `RCLONE_CONFIG_PATH`: The path to the rclone configuration file. This file should contain the configuration for the remote storage where the backup will be stored.
* `BACKUP_PATH`: The path where the backup files will be stored locally. If this variable is not set, the default path `/var/lib/backup` will be used.
* `BACKUP_NAME`: The name of the backup. If this variable is not set, the current date and time will be used as the backup name.
* `REMOTE_URL`: The URL of the remote storage where the backup will be stored.

You can also provide the following optional environment variables to customize the `arangodump` command:

* `ALL_DATABASES`: If set to `true`, all databases will be backed up. If set to `false`, only the specified database will be backed up.
* `BATCH_SIZE`: The size of the data batches in bytes.
* `COLLECTION`: The name of the collection to be backed up.
* `COMPRESS_OUTPUT`: If set to `true`, the output will be compressed.
* `COMPRESS_REQUEST_THRESHOLD`: The threshold for compressing requests in bytes.
* `COMPRESS_TRANSFER`: If set to `true`, the transfer will be compressed.
* `CONFIGURATION`: The path to the ArangoDB configuration file.
* `DESCRIPTORS_MINIMUM`: The minimum number of descriptors to be used.
* `DOCS_PER_BATCH`: The number of documents per batch.
* `DUMP_DATA`: If set to `true`, the data will be dumped.
* `DUMP_VIEWS`: If set to `true`, the views will be dumped.
* `FORCE`: If set to `true`, the backup will be forced.
* `IGNORE_COLLECTION`: The name of the collection to be ignored.
* `IGNORE_DISTRIBUTE_SHARDS_LIKE_ERRORS`: If set to `true`, errors related to distributing shards will be ignored.
* `INCLUDE_SYSTEM_COLLECTIONS`: If set to `true`, system collections will be included in the backup.
* `INITIAL_BATCH_SIZE`: The initial size of the data batches in bytes.
* `MASKINGS`: The maskings to be used.
* `OVERWRITE`: If set to `true`, existing files will be overwritten.
* `PROGRESS`: If set to `true`, the progress will be displayed.
* `SHARD`: The name of the shard to be backed up.
* `SPLIT_FILES`: If set to `true`, the output files will be split.
* `THREADS`: The number of threads to be used.
* `USE_SPLICE_SYSCALL`: If set to `true`, the splice syscall will be used.
* `SERVER_AUTHENTICATION`: If set to `true`, authentication will be used.
* `SERVER_CONNECTION_TIMEOUT`: The connection timeout in seconds.
* `SERVER_DATABASE`: The name of the database to be backed up.
* `SERVER_ENDPOINT`: The endpoint of the ArangoDB server.
* `SERVER_PASSWORD`: The password for the ArangoDB server.
* `SERVER_REQUEST_TIMEOUT`: The request timeout in seconds.
* `SERVER_USERNAME`: The username for the ArangoDB server.
* `SSL_PROTOCOL`: The SSL protocol to be used.

To run the container, you can use the following command:

```bash
docker run -it \
    -e RCLONE_CONFIG_PATH=/path/to/rclone.conf \
    -e BACKUP_PATH=/path/to/backup \
    -e ALL_DATABASES=true \
    -e SERVER_ENDPOINT=http://localhost:8529 \
    -e SERVER_PASSWORD=some-password \
    -e REMOTE_URL=S3://arango-backups \
    ghcr.io/kraudcloud/arango-backup
```

This will run the container and perform the backup using the specified options. The backup files will be stored in the specified `BACKUP_PATH` and then copied to the remote storage using `rclone`.
