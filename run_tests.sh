#!/usr/bin/env bash

set -ex
SCALA_VERSION="${SCALA_VERSION:-2.12.21}"

#bazel coverage //specs2_with_junit:test-specs2-with-junit
bazel coverage --repo_env="SCALA_VERSION=${SCALA_VERSION}" //scalatest:foo_test
ls -l bazel-testlogs/scalatest/foo_test
#ls -l bazel-testlogs/{specs2_with_junit/test-specs2-with-junit,scalatest/test-scalatest}

#bazel coverage @rules_scala//test/coverage_specs2_with_junit:test-specs2-with-junit
#bazel coverage @rules_scala//test/coverage_scalatest:test-scalatest
#ls -l bazel-testlogs/external/rules_scala+/test/coverage_{specs2_with_junit/test-specs2-with-junit,scalatest/test-scalatest}
