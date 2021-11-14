import Foundation

enum ExpressionParser {
    static func parse(from input: String) -> Formula {
        var formula = Formula()
        
        let componentsOfOperands = componentsByOperators(from: input)
        let _ = componentsOfOperands.map { formula.operands.enqueue(value: Double($0)!) }
        
        for characterOfInput in input {
            if let symbol = Operator(rawValue: characterOfInput) {
                formula.operators.enqueue(value: symbol)
            }
        }
        
        return formula
    }
    
    static func componentsByOperators(from input: String) -> [String] {
        var components: [String] = [input]
        var temporaryArray: [String] = []
        
        for operatorSymbol in Operator.allCases {
            for element in components {
                temporaryArray += element.split(with: operatorSymbol.rawValue)
            }
            components = temporaryArray
            temporaryArray = []
        }
        
        return components
    }
}

struct Formula {
    var operands: CalculatorItemQueue<Double> = CalculatorItemQueue()
    var operators: CalculatorItemQueue<Operator> = CalculatorItemQueue()
    
//    mutating func result() -> Double { // = 을 눌렀을 때 최종 결과값을 구해줌
//        var result: Double = 0 // ???
//
//        var removedFromOperands = operands.dequeue()
//        var removedFromOperators = operators.dequeue()
//
//        // while문으로 먼저 해보고
//        // 클로저 안에 reduce로 구현해보기
////        result = operands.scanAllValues().reduce(0, { operators.dequeue()?.calculate(lhs: <#T##Double#>, rhs: <#T##Double#>)
////
////        })
//        return result
//    }
}

protocol CalculateItem {
}

struct CalculatorItemQueue<T: CalculateItem> {
    private(set) var items: LinkedList<T> = LinkedList<T>(head: nil)

    mutating func enqueue(value: T) {
        items.append(value: value)
    }

    mutating func dequeue() -> T? { // 빈 큐에서 dequeue 하면 오류처리를 해야 할까?
        let removedValue: T? = items.removeFirst()
        return removedValue
    }

    mutating func scanAllValues() -> [T] {
        let allValues: [T] = items.scanAllValues()
        return allValues
    }

    mutating func allClear() {
        items.removeAll()
    }
}

