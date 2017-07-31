#!/bin/bash
set -e

CLUSTER="http://...squirro.net/"
TOKEN="...abc..."
PROJECT_ID="...123..."

squirro_data_load -v \
    --cluster $CLUSTER \
    --token $TOKEN \
    --project-id $PROJECT_ID \
    --source-type csv \
    --source-file 'companies.csv' \
    --source-name 'CSV File' \
    --map-title 'ticker' \
    --map-body 'company' \
    --map-id 'id' \
    --map-url 'link' \
    --map-created-at 'ipo_date' \
    --facets-file 'facets.json'
