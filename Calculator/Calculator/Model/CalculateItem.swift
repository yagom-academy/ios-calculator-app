import Foundation

protocol CalculateItem {
    
}

extension Double: CalculateItem {
    
}

enum Operator: Character, CaseIterable, CalculateItem {
    case add = "+"
    case subtract = "-"
    case divide = "/"
    case multiply = "*"
    
    func calculate() -> Double {
        return 0.1
    }
    
    func add() -> Double {
        return 0.1
    }
    
    func subtract() -> Double {
        return 0.1
    }
    
    func divide() -> Double {
        return 0.1
    }
    
    func multiply() -> Double {
        return 0.1
    }
}
