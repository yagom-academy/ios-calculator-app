//
//  Operand.swift
//  Calculator
//
//  Created by Hamo on 2022/10/01.
//

enum Operand {
    case one
    case two
    case three
    case four
    case five
    case six
    case seven
    case eight
    case nine
    
    var bringOperandSymbol: String {
        switch self {
        case .one:
            return "1"
        case .two:
            return "2"
        case .three:
            return "3"
        case .four:
            return "4"
        case .five:
            return "5"
        case .six:
            return "6"
        case .seven:
            return "7"
        case .eight:
            return "8"
        case .nine:
            return "9"
        }
    }
    
    static func matchOperandButtonTag(location: Int) -> Operand? {
        switch location {
        case 1:
            return .one
        case 2:
            return .two
        case 3:
            return .three
        case 4:
            return .four
        case 5:
            return .five
        case 6:
            return .six
        case 7:
            return .seven
        case 8:
            return .eight
        case 9:
            return .nine
        default:
            return nil
        }
    }
}
