# Empty `bazel coverage` reproduction

[bazelbuild/bazel#28826: Empty coverage.dat files after first bazel coverage
since ca7d260](https://github.com/bazelbuild/bazel/issues/28826)

This example produces no errors on macOS Tahoe 26.3 (25D125) when using Bazel
7.7.1, 8.6.0, 9.0.0, and 10.0.0-pre.20260211.1.

```sh
# For Bazelisk builds
USE_BAZEL_VERSION=7.7.1 ./run_tests.sh
```

This example fails on `last_green` builds containing
bazelbuild/bazel@ca7d260dbeb7915a5003c044add2b85effe55e8b.

```sh
# For Bazelisk builds
USE_BAZEL_VERSION=last_green ./run_tests.sh

# Adds a locally built `bazel` to `PATH`
PATH="${HOME}/src/bazelbuild/bazel/bazel-bin/src:${PATH}" ./run_tests.sh
```

Discovered via the following in a bazelbuild/bazel clone:

```sh
git bisect start
git bisect good 6edc9a8b61395ca54794479d2e9fee47a68dd4b6
git bisect bad acfecad0b7ce464c8a15c0b4f72f6c3faef40e6d
```

## Modifications

See the [run_tests.sh](./run_tests.sh) comments for how to edit the commands to
achieve different results.

## Original

Modeled after failures from [test_coverage.sh in bazel-contrib/rules_scala
v7.2.2][orig] while running the `last_green` Bazel starting at
bazelbuild/bazel@acfecad0b7ce464c8a15c0b4f72f6c3faef40e6d.

[orig]: https://github.com/bazel-contrib/rules_scala/blob/v7.2.2/test_coverage.sh
