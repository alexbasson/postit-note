import Cocoa

class RequestBuilderViewController: NSViewController {
  @IBOutlet weak var requestView: RequestView?
  @IBOutlet weak var responseView: ResponseView?

  var session = NSURLSession.sharedSession()

  func configure(session: NSURLSession) {
    self.session = session
  }

  override func viewDidLoad() {
    super.viewDidLoad()
    setupHTTPMethodMenu()
  }

  @IBAction func sendButtonTapped(sender: NSButton) {
    let task = session.dataTaskWithRequest(self.requestFromFields()) {
      (data: NSData?, response: NSURLResponse?, error: NSError?) -> Void in
      if let
        data = data,
        response = response as? NSHTTPURLResponse,
        responseView = self.responseView,
        httpStatusLabel = responseView.httpStatusLabel,
        responseBodyTextView = responseView.responseBodyTextView
      {
        performOnMainQueue() {
          httpStatusLabel.stringValue = "\(response.statusCode)"
          responseBodyTextView.string = String(data: data, encoding: NSUTF8StringEncoding)!
        }
      }
    }
    task.resume()
  }
}

extension RequestBuilderViewController {
  func requestFromFields() -> NSURLRequest {
    let request = NSMutableURLRequest()
    if let
      requestView = self.requestView,
      httpMethodPopUpButton = requestView.httpMethodPopUpButton,
      method = httpMethodPopUpButton.titleOfSelectedItem,
      urlTextField = requestView.urlTextField
    {
      request.HTTPMethod = method
      request.URL = NSURL(string: urlTextField.stringValue)
    }
    return request
  }
}

extension RequestBuilderViewController {
  func setupHTTPMethodMenu() {
    if let
      requestView = self.requestView,
      httpMethodPopUpButton = requestView.httpMethodPopUpButton
    {
      let menu = NSMenu(title: "method")
      menu.addItemWithTitle("GET", action: nil, keyEquivalent: "")
      menu.addItemWithTitle("POST", action: nil, keyEquivalent: "")
      menu.addItemWithTitle("PATCH", action: nil, keyEquivalent: "")
      menu.addItemWithTitle("DELETE", action: nil, keyEquivalent: "")
      httpMethodPopUpButton.menu = menu
    }
  }
}