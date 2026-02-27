load("@rules_java//java:defs.bzl", "java_library")
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
    deps = [":bar"],
)

java_library(
    name = "bar",
    srcs = ["Bar.java"],
)
