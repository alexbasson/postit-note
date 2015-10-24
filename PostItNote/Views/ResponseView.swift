import Cocoa

class ResponseView: NSView {
  @IBOutlet weak var httpStatusLabel: NSTextField?
  @IBOutlet var responseBodyTextView: NSTextView?
}
