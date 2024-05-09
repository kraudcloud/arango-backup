#!/usr/bin/env bash

set -e -o pipefail

arangodump_args=()

add_arg() {
    if [ -n "$2" ]; then
        arangodump_args+=("$1" "$2")
    fi
}

add_arg "--all-databases" "$ALL_DATABASES"
add_arg "--batch-size" "$BATCH_SIZE"
add_arg "--collection" "$COLLECTION"
add_arg "--compress-output" "$COMPRESS_OUTPUT"
add_arg "--compress-request-threshold" "$COMPRESS_REQUEST_THRESHOLD"
add_arg "--compress-transfer" "$COMPRESS_TRANSFER"
add_arg "--configuration" "$CONFIGURATION"
add_arg "--descriptors-minimum" "$DESCRIPTORS_MINIMUM"
add_arg "--docs-per-batch" "$DOCS_PER_BATCH"
add_arg "--dump-data" "$DUMP_DATA"
add_arg "--dump-views" "$DUMP_VIEWS"
add_arg "--force" "$FORCE"
add_arg "--ignore-collection" "$IGNORE_COLLECTION"
add_arg "--ignore-distribute-shards-like-errors" "$IGNORE_DISTRIBUTE_SHARDS_LIKE_ERRORS"
add_arg "--include-system-collections" "$INCLUDE_SYSTEM_COLLECTIONS"
add_arg "--initial-batch-size" "$INITIAL_BATCH_SIZE"
add_arg "--maskings" "$MASKINGS"
add_arg "--output-directory" "$BACKUP_PATH"
add_arg "--overwrite" "$OVERWRITE"
add_arg "--progress" "$PROGRESS"
add_arg "--shard" "$SHARD"
add_arg "--split-files" "$SPLIT_FILES"
add_arg "--threads" "$THREADS"
add_arg "--use-splice-syscall" "$USE_SPLICE_SYSCALL"
add_arg "--server.authentication" "$SERVER_AUTHENTICATION"
add_arg "--server.connection-timeout" "$SERVER_CONNECTION_TIMEOUT"
add_arg "--server.database" "$SERVER_DATABASE"
add_arg "--server.request-timeout" "$SERVER_REQUEST_TIMEOUT"
add_arg "--server.username" "$SERVER_USERNAME"
add_arg "--ssl.protocol" "$SSL_PROTOCOL"
set -u
add_arg "--server.endpoint" "$SERVER_ENDPOINT"
add_arg "--server.password" "$SERVER_PASSWORD"

rclone_config=${RCLONE_CONFIG_PATH?"RCLONE_CONFIG_PATH is not set"}
backup_path=${BACKUP_PATH:-/var/lib/backup}
backup_name=${BACKUP_NAME:-$(date +%Y-%m-%d_%H-%M-%S)}
remote_url=${REMOTE_URL?"REMOTE_URL is not set, eg S3://arango-backups. See https://rclone.org/ for more information."}

mkdir -p $backup_path

arangodump "${arangodump_args[@]}" 2>/dev/null

rclone --config $rclone_config copy $backup_path $remote_url/$backup_name
