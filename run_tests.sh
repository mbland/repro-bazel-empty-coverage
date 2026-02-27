#!/usr/bin/env bash

SCALA_VERSION="${SCALA_VERSION:-2.12.21}"

echo "Bazel:   $(command -v bazel)"
echo "Version: $(bazel --version)"

set -ex
bazel coverage --repo_env="SCALA_VERSION=${SCALA_VERSION}" //specs2_with_junit:foo_test
bazel coverage --repo_env="SCALA_VERSION=${SCALA_VERSION}" //scalatest:foo_test
ls -l bazel-testlogs/{specs2_with_junit,scalatest}/foo_test
