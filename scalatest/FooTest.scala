package coverage_scalatest

import org.scalatest.flatspec._

class FooTest extends AnyFlatSpec {
  "testFoo" should "work" in {
    assert(Foo.add(2, 2) == 4)
  }
}
