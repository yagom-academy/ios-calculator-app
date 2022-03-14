//
//  CalculatorItemQueue.swift
//  Calculator
//
//  Created by 김태현 on 2022/03/14.
//

enum Oprator: String {
    case addition = "+"
    case subtraction = "-"
    case devision = "/"
    case multiplication = "*"
}

enum CalculatorItem: Equatable {
    static func == (lhs: CalculatorItem, rhs: CalculatorItem) -> Bool {
        return lhs.value == rhs.value
    }
    
    case numbers(Double)
    case `operator`(Oprator)
    
    var value: String? {
        switch self {
        case .numbers(let num):
            return String(num)
        case .operator(let opr):
            return opr.rawValue
        }
    }
}

struct CalculatorItemQueue {
    var queue: [CalculatorItem]
    var front: Int
    var rear: Int
    
    init(queue: [CalculatorItem] = [], front: Int = -1, rear: Int = -1) {
        self.queue = queue
        self.front = front
        self.rear = rear
    }
}
