import UIKit

extension UIScrollView {
    func scrollToBottom() {
        if contentSize.height > bounds.size.height {
            self.calculatorScrollView.layoutIfNeeded()
            let bottomEdge = contentSize.height - bounds.size.height
            setContentOffset(CGPoint(x: 0, y: bottomEdge), animated: true)
        }
    }
}
