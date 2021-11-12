import Foundation

enum ExpressionParser {
    static func componentsByOperators(from input: String) -> [String] {
        var components: [String] = []
        var inputWithSpace: String = input
        let operatorSymbols: [String] = Operator.allCases.map { String($0.rawValue) }
        
        for operatorSymbol in operatorSymbols {
            inputWithSpace = inputWithSpace.replacingOccurrences(of: String(operatorSymbol), with: " \(operatorSymbol) ")
        }
        
        components = inputWithSpace.split(with: " ").filter { operatorSymbols.contains($0) == false }
        return components
    }
}

struct Formula {
    var operands: CalculatorItemQueue<Double>
    var operators: CalculatorItemQueue<Operator>
    
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
//
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

