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
    case allClear = "AC"
    case clearElement = "CE"
    case swapNumberSign = "SwapNumberSign"
    case enterDecimalPoints = "EnterDecimalPoints"
    case calculation = "Calculation"
}
