import UIKit

class OperatorLabel: UILabel, Resettable {
    func reset() {
        self.text = nil
    }
}
