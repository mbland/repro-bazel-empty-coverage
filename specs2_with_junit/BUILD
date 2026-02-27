load(
    "@rules_scala//scala:scala.bzl",
    "scala_library",
    "scala_specs2_junit_test",
)

scala_specs2_junit_test(
    name = "foo_test",
    srcs = ["FooTest.scala"],
    prefixes = ["Test"],
    deps = [":foo"],
)

scala_library(
    name = "foo",
    srcs = ["Foo.scala"],
)
