import Foundation

extension String {
    func split(with target: Character) -> [String] {
        let splitedArray = self.replacingOccurrences(of: target.description, with: " ")
        return [splitedArray]
        
    }
}

enum ExpressionParser {
    static func parse(from inputString: String) -> Formula {
        let numberArrayInString = componentsByOperators(from: inputString)
        var inputArrayInString = inputString.map { String($0) }
        
        inputArrayInString = inputArrayInString.filter {!numberArrayInString.contains($0)}
        
        let numberArrayInDouble = numberArrayInString.map {Double($0) ?? 0 }
        let operatorArrayInOperator = inputArrayInString.map {Operator(rawValue: Character($0))!}
        
        let operands = CalculatorItemQueue<Double>(calculatorItems: numberArrayInDouble)
        let operators = CalculatorItemQueue<Operator>(calculatorItems: operatorArrayInOperator)
        let formula = Formula(operands: operands, operators: operators)

        return formula
    }

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
