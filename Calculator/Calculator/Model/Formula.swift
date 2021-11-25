import Foundation

struct Formula {
    var operands = CalculatorItemQueue<Double>()
    var operators = CalculatorItemQueue<Character>()
    
    func result() -> Double {
        guard var tempValue = try? operands.deleteFromQueue() else {
            return 0
        }
        while operands.linkedList.head != nil {
            guard let currentOperand = try? operands.deleteFromQueue(),
                  let currentOperator = try? operators.deleteFromQueue(),
                  let operatorCase = Operator(rawValue: currentOperator) else {
                      return 0
                  }
          
            tempValue = operatorCase.calculate(lhs: tempValue, rhs: currentOperand)
        }
        return tempValue
    }
}

//
//while operands.linkedList.head != nil {
//    do {
//        let currentOperand = try operands.deleteFromQueue()
//        let currentOperator = try operators.deleteFromQueue()
//        let operatorCase = Operator(rawValue: currentOperator)
//
//        guard let currentNumber = Operator(rawValue: eachOperation)?.calculate(lhs: firstOperand, rhs: secondOperand) else {
//            throw QueueError.EmptyInLinkedList
//        }
//        value += currentNumber
//    } catch QueueError.EmptyInLinkedList {
//        break
//    }
//}
//return 0
//}
//}
