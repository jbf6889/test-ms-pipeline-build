#!/bin/bash

./gradlew build test --no-daemon

EXIT_CODE=${?}

mkdir -p output
cp -R build output

exit ${EXIT_CODE}