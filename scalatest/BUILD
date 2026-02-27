load("@rules_java//java:defs.bzl", "java_library")
load("@rules_scala//scala:scala.bzl", "scala_library", "scala_test")

scala_test(
    name = "foo_test",
    srcs = ["FooTest.scala"],
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
