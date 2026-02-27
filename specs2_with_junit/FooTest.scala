package specs2_with_junit

import org.specs2.mutable.SpecWithJUnit

class TestWithSpecs2WithJUnit extends SpecWithJUnit {
  "testFoo" in {
    Foo.concat("foo", "bar") must be_==("foobar")
  }
}
