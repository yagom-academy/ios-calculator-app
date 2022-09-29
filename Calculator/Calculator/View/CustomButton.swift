import UIKit
class OprandButton: UIButton {
    private let identifierList: [String: String] = ["one": "1", "two": "2", "three": "3", "four": "4", "five": "5",
                                                    "six": "6", "seven": "7", "eight": "8", "nine": "9",
                                                    "zero": "0", "doublyZero": "00"]
    var number: String? {
        return convertNumber(about: self.restorationIdentifier)
    }
    
    private func convertNumber(about restorationIdentifier: String?) -> String? {
        guard let identifier = restorationIdentifier,
              let number = identifierList[identifier] else {
            return nil
        }
        return number
    }
}

class OperatorButton: UIButton {
    private let identifierList: [String: String] = ["add": "+", "subtract": "−", "divide": "÷", "multiply": "×"]

    var operatorSign: String? {
        return convertOperatorSign(about: self.restorationIdentifier)
    }
    
    private func convertOperatorSign(about restorationIdentifier: String?) -> String? {
        guard let identifier = restorationIdentifier,
              let operatorSign = identifierList[identifier] else {
            return nil
        }
        return operatorSign
    }
}

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
