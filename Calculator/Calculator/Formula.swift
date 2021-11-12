import Foundation

struct Formula {
    var operands = CalculatorItemQueue<Double>()
    var operators = CalculatorItemQueue<Character>()
    
    func result() -> Double {
        var result: Double = 0
        while operands.linkedList.head == nil {
            let value = operands.deleteFromQueue()
            guard let oper = Operator(rawValue: operators.deleteFromQueue()) else {
                return 0      // 에러처리 구문 추가 시 수정
            }
            result = oper.calculate(lhs: result, rhs: value)
        }
        return result
    }
}

extension String {
    func split(with target: Character) -> [String] {
        let splitedString = self.split(separator: target).map { String($0) }
        return splitedString
    }
}




