import Foundation

extension String {
    func split(with target: Character) -> [String] {
        let splitedArray = self.replacingOccurrences(of: target.description, with: " ")
        return [splitedArray]
        
    }
}

enum ExpressionParser {
    //숫자 배열을 가지고 input에서 다시 연산자 거르는애 -> 형식에맞게 둘다 리턴
    static func parse(from inputString: String) -> Formula {
        //[1,2,3,4]
        let numberArrayInString = componentsByOperators(from: inputString)
        
        //문자열 input를 배열로 변경: [1,+,2,-,3,/,4]
        var inputArrayInString = inputString.map { String($0) }
        
        //배열을 숫자만있는배열을 이용해 숫자를제거해 연산자만 배열에담음
        inputArrayInString = inputArrayInString.filter {!numberArrayInString.contains($0)}
        
        let numberArrayInDouble = numberArrayInString.map {Double($0) ?? 0 }
        let operatorArrayInOperator = inputArrayInString.map {Operator(rawValue: Character($0))!}
        
        let operands = CalculatorItemQueue<Double>(calculatorItems: numberArrayInDouble)
        let operators = CalculatorItemQueue<Operator>(calculatorItems: operatorArrayInOperator)
        let formula = Formula(operands: operands, operators: operators)

        return formula
    }
    //숫자만 걸러서 리턴하는애
    static func componentsByOperators(from input: String) -> [String] {
        var numberString = input
        
        Operator.allCases.forEach {
            guard let numberArrayWithBlank = numberString.split(with: $0.rawValue).first else {return}
            numberString = numberArrayWithBlank
        }
        
        let numberArray = numberString.components(separatedBy: " ")
        
        return numberArray
    }
}
