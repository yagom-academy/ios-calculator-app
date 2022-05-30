enum Keypad: CaseIterable {
    case zero
    case one
    case two
    case three
    case four
    case five
    case six
    case seven
    case eight
    case nine
    case doubleZero
    case decimalPoint

    var number: Int {
        switch self {
        case .zero:
            return 0
        case .one:
            return 1
        case .two:
            return 2
        case .three:
            return 3
        case .four:
            return 4
        case .five:
            return 5
        case .six:
            return 6
        case .seven:
            return 7
        case .eight:
            return 8
        case .nine:
            return 9
        case .doubleZero:
            return 10
        case .decimalPoint:
            return 11
        }
    }

    static func convertNumber(_ index: Int) -> String {
        switch index {
        case Keypad.doubleZero.number:
            return "00"
        case Keypad.decimalPoint.number:
            return "."
        default:
            let result = Keypad.allCases.filter {
                $0.number == index
            }.map {String($0.number)}.joined()
            return result
        }
    }
}

