@Library('jbf-jenkins-shared-libs@master') _

default_ms_pipeline {

DOCKER_IMAGE_NAME = 'testdockerimage'

PROJECT = 'test-ms-pipeline-build'

DEV_ENV = [
platform: 'EKS',
activated: 'yes',
runTests: 'no',
//branch: "${env.BRANCH_NAME}"
]

}