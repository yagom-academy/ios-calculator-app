import UIKit

extension UIScrollView {
    func moveToBottom() {
        layoutIfNeeded()
        let bottomOffset = CGPoint(x: 0, y: self.contentSize.height - self.bounds.size.height)
        setContentOffset(bottomOffset, animated: true)
    }
}
