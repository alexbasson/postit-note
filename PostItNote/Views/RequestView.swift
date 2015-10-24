import Cocoa

class RequestView: NSView {
  @IBOutlet weak var httpMethodPopUpButton: NSPopUpButton?
  @IBOutlet weak var urlTextField: NSTextField?
  @IBOutlet weak var sendButton: NSButton?
}
