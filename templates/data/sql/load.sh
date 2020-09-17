#!/usr/bin/env bash
cd $(dirname $0)
set -e
source ../../common/config/config.sh

squirro_data_load -v \
    --token $TOKEN \
    --cluster $CLUSTER \
    --project-id $PROJECT_ID \
    --log-file 'Data_Loading.log' \
    --source-type database \
    --db-connection 'mysql://root:@localhost/database-name' \
    --input-file 'query.sql' \
    --input-query 'SELECT * FROM TABLE' \
    --source-name 'Data' \
    --map-title 'title' \
    --map-abstract 'abstract' \
    --map-body 'body' \
    --map-body-mime 'body_mime' \
    --map-id 'id' \
    --map-url 'link' \
    --map-created-at 'created_at' \
    --facets-file 'facets.json' \
    --title-template-file 'title_template.j2' \
    --body-template-file 'body_template.j2' \
    --pipelets-file 'pipelets.json'
