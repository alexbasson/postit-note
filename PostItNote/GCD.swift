import Foundation

func performOnMainQueue(closure: () -> Void) {
  dispatch_async(dispatch_get_main_queue()) {
    closure()
  }
}
