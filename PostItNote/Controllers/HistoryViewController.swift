import Cocoa

class HistoryViewController: NSViewController {

}

extension HistoryViewController: NSTableViewDataSource {
  func numberOfRowsInTableView(tableView: NSTableView) -> Int {
    return 3
  }

  func tableView(tableView: NSTableView, objectValueForTableColumn tableColumn: NSTableColumn?, row: Int) -> AnyObject? {
    return "An object"
  }
}

extension HistoryViewController: NSTableViewDelegate {

}

