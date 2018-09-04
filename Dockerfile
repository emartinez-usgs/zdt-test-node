FROM usgs/node:8


COPY . /hazdev-project
RUN chown -R usgs-user:usgs-user /hazdev-project

USER usgs-user
RUN /bin/bash --login -c " \
    cd /hazdev-project && \
    npm --no-save install && \
    rm -rf \
      ${HOME}/.npm \
      /tmp/npm* \
  "


HEALTHCHECK \
    --interval=5s \
    --timeout=2s \
    --start-period=30s \
    --retries=3 \
  CMD \
    /hazdev-project/healthcheck.sh

CMD [ "/hazdev-project/docker-entrypoint.sh" ]
