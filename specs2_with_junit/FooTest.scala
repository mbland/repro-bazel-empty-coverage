package coverage_specs2_with_junit

import org.specs2.mutable.SpecWithJUnit

class TestWithSpecs2WithJUnit extends SpecWithJUnit {
  "testFoo" in {
    Foo.add(2, 2) must be_==(4)
  }
}
