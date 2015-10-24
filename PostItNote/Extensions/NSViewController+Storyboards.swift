import AppKit

extension NSViewController {
  class func storyboardIdentifier() -> String {
    let className = NSStringFromClass(self)
    let classNameComponents = className.characters.split { $0 == "." }.map{ String($0) }
    return classNameComponents[1]
  }

  class func instantiateFromStoryboard(name: String) -> NSViewController {
    let storyboard = NSStoryboard(name: name, bundle: nil)
    return storyboard.instantiateControllerWithIdentifier(self.storyboardIdentifier()) as! NSViewController
  }
}