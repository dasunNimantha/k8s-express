ARG DOCKER_REGISTRY
ARG VERSION

# FROM ${DOCKER_REGISTRY}/alpine:latest
FROM alpine:latest

LABEL maintainer="Team Synergy <TeamSynergy@dips.no>" \
    org.opencontainers.image.version="${VERSION}" \
    org.opencontainers.image.description="Contains necessary plugins for Opensearch Stack" \
    org.opencontainers.image.title="Opensearch Plugin Installer"

WORKDIR /plugins

COPY ./plugins/* ./plugins