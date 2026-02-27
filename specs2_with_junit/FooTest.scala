package coverage_specs2_with_junit

import org.specs2.mutable.SpecWithJUnit

class TestWithSpecs2WithJUnit extends SpecWithJUnit {
  "testFoo" in {
    Foo.reverse("bar") must be_==("rab")
  }
}
