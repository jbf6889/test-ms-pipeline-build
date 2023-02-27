FROM gradle:latest as build

USER root
WORKDIR /app
COPY ./ /app/
RUN gradle clean build -x test --no-daemon --console plain

FROM openjdk:17
USER root
RUN set -o errexit -o nounset \
    && groupadd --system --gid 1000 appuser \
    && useradd --system --gid appuser --uid 1000 --shell /bin/bash --create-home appuser \
    && mkdir -p /app \
    && chown -R appuser:root /app \
    && chmod -R g=u /app

WORKDIR /app
COPY --chown=appuser:root --from=build /app/build/libs/test-ms-pipeline-build-0.0.1-SNAPSHOT.jar /app/app.jar
USER appuser

ENTRYPOINT ["java","-jar", "/app/app.jar"]