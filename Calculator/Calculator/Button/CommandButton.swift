import UIKit

class CommandButton: UIButton {
    var command: Command? {
        guard let identifier = self.restorationIdentifier else {
            return nil
        }
        return Command.init(rawValue: identifier)
    }
}

enum Command: String {
    case AllClear = "AC"
    case ClearElement = "CE"
    case SwapNumberSign
    case EnterDecimalPoints
    case calculation
}
