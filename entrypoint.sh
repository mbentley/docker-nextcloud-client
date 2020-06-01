#!/bin/sh

# check to see if needed env vars have been passed
if [ -z "${NEXTCLOUD_URL}" ]
then
  echo "Missing NEXTCLOUD_URL"
  exit 1
fi

if [ -z "${USERNAME}" ]
then
  echo "Missing USERNAME"
  exit 1
fi

if [ -z "${PASSWORD}" ]
then
  echo "Missing PASSWORD"
  exit 1
fi

# make sure we have a bind mounted directory to sync to
if [ ! -d "/data" ]
then
  echo "/data directory not found; make sure you bind mount the destination"
  exit 1
fi

# make options available
OPTIONS="${OPTIONS:---non-interactive}"

# execute nextcloud sync
exec nextcloudcmd -u "${USERNAME}" -p "${PASSWORD}" ${OPTIONS} /data "${NEXTCLOUD_URL}"
