#!/bin/bash

function cleanup() {
    rm -f tmpJenkinsCookie.txt
}

CRUMB=$(curl -s "$JENKINS_ENDPOINT"'/crumbIssuer/api/xml?xpath=concat(//crumbRequestField,":",//crumb)' -u root:"$GITLAB_TOKEN" -c tmpJenkinsCookie.txt)

TOKEN=$(curl "$JENKINS_ENDPOINT"'/user/admin/descriptorByName/jenkins.security.ApiTokenProperty/generateNewToken' \
    --data 'newTokenName=job-creation' \
    -u root:"$GITLAB_TOKEN" \
    -H "$CRUMB" \
    -b tmpJenkinsCookie.txt | jq -r .data.tokenValue)

curl -s -XPOST "$JENKINS_ENDPOINT"'/createItem?name='"$JOB_NAME" -u root:"$TOKEN" --data-binary @"$JENKINS_JOB_FILE" -H 'Content-Type:text/xml'

# crumb request creates a cookie file to track session
# this ensures the file is deleted
trap cleanup EXIT
