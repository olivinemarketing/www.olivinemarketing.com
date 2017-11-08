#!/bin/bash

: "${DISTRIBUTION_ID:?Need to set DISTRIBUTION_ID non-empty}"
: "${AWS_ACCESS_KEY_ID:?Need to set AWS_ACCESS_KEY_ID non-empty}"
: "${AWS_SECRET_ACCESS_KEY:?Need to set AWS_SECRET_ACCESS_KEY non-empty}"
if [[ $1 == "production" ]]
then
  cactus deploy
  aws cloudfront create-invalidation --distribution-id $DISTRIBUTION_ID --paths '/*'
fi
