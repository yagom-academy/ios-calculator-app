import UIKit

extension UIScrollView {
    func scrollToBottom() {
        self.layoutIfNeeded()
        if contentSize.height > bounds.size.height {
            let bottomEdge = contentSize.height - bounds.size.height
            setContentOffset(CGPoint(x: 0, y: bottomEdge), animated: true)
        }
    }
}
