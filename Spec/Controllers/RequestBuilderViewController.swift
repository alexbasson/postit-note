import Quick
import Nimble
import PostItNote
import AppKit

class RequestBuilderViewController: QuickSpec {
  override func spec() {
    var subject: RequestBuilderViewController!

    beforeEach {
      subject = RequestBuilderViewController.instantiateFromStoryboard("Main")
    }

    describe("setting up the http method pop up button") {
      it("fails") {
        expect(false).to(beTrue())
      }
    }
  }
}
