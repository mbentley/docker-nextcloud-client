# mbentley/nextcloud-client

docker image for [nextcloudcmd](https://docs.nextcloud.com/desktop/2.6/advancedusage.html#nextcloud-command-line-client)
based off of alpine:latest

To pull this image:
`docker pull mbentley/nextcloud-client`

Example usage:

```
docker run -t --rm \
  --name nextcloud-client \
  -u "$(id -u):$(id -g)" \
  -e NEXTCLOUD_URL="https://nextcloud.example.com" \
  -e USERNAME="username" \
  -e PASSWORD="password" \
  -e OPTIONS="--non-interactive" \
  -v ${HOME}/Nextcloud:/data \
  mbentley/nextcloud-client
```

**Note**: The `nextcloudcmd` client performs single sync run and then exits.  It does not sync at a regular interval automatically. I would suggest setting up a cronjob if you want regular syncing.
