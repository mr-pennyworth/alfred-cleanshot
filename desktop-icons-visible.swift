import Cocoa

// CleanShot X hides desktop icons by creating
// a window that spans the entire screen and has
// the same background as the wallpaper.

let windows =
  (CGWindowListCopyWindowInfo(.optionOnScreenOnly, .zero)! as NSArray)
  .map { $0 as! [String: Any] }
  .filter { $0["kCGWindowOwnerName"] as! String == "CleanShot X" }
  .filter { ($0["kCGWindowLayer"] as! Int) < 0 }

exit(Int32(windows.count))
