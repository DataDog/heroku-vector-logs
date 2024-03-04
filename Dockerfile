# Using `latest` so if someone copies this they get the current version...
# But ideally you should specify the version.
FROM timberio/vector:latest-debian

# Copy our local config to the correct place. Note, Heroku does no allow volume
# mounts for containers, so we cannot run the published Vector image and simply
# mount our config.
# See https://vector.dev/docs/reference/configuration/ for config info and options.
COPY vector.yaml /etc/vector/vector.yaml

# Use the CMD to add arguments to the Vector container's entrypoint. Note, if the
# CMD is removed, Heroku will add a default `sh -c` command that causes the
# Vector container's entrypoint to fail.
CMD ["--config", "/etc/vector/vector.yaml"]
