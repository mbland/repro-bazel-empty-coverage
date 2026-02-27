#!/usr/bin/env bash

echo "Bazel:   $(command -v bazel)"
BAZEL_VERSION="$(bazel --version)"
echo "Version: ${BAZEL_VERSION}"

PROTOC_WORKAROUND=()

if [[ "$BAZEL_VERSION" =~ ^bazel\ (10\.|no_version) ]]; then
  # For now, set this for Bazel prereleases to avoid recompiling `protoc`.
  # See: https://github.com/protocolbuffers/protobuf/issues/25561
  PROTOC_WORKAROUND=("--noincompatible_exclude_starlark_flags_from_exec_config")
fi

set -ex

# The comments below apply when running with a Bazel containing
# bazelbuild/bazel@ca7d260dbeb7915a5003c044add2b85effe55e8b.

# The second separate `bazel coverage` invocation produces empty coverage data
# without specifying `--nocache_test_results`.
#
# Reverse the blocks below, and the `specs2_with_junit` diff will fail instead.

# Run `bazel clean` and add `//scalatest:foo_test` to this first command, and
# the `scalatest` diff will pass.
#
# After first building `//scalatest:foo_test` by itself, adding it to this first
# command will have no effect.
bazel coverage "${PROTOC_WORKAROUND[@]}" //specs2_with_junit:foo_test
diff specs2_with_junit/expected-coverage.dat \
  bazel-testlogs/specs2_with_junit/foo_test/coverage.dat

# Add `--nocache_test_results` and the final `diff` will pass.
bazel coverage "${PROTOC_WORKAROUND[@]}" //scalatest:foo_test
diff scalatest/expected-coverage.dat \
  bazel-testlogs/scalatest/foo_test/coverage.dat
