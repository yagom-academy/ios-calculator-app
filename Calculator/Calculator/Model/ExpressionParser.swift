import Foundation

extension String {
    func split(with target: Character) -> [String] {
        let splitedArray = self.replacingOccurrences(of: target.description, with: " ")
        return [splitedArray]
    }
}

enum ExpressionParser {
    static func parse(from inputString: String) -> Formula {
        let inputArrayInString = inputString.map {String($0)}
        let operandArray = componentsByOperators(from: inputString).compactMap{Double($0)}
        let operatorArray = inputArrayInString.filter{Operator(rawValue: Character($0)) != nil}.compactMap{Operator(rawValue: Character($0))}
        
        let operands = CalculatorItemQueue<Double>(calculatorItems: operandArray)
        let operators = CalculatorItemQueue<Operator>(calculatorItems: operatorArray)
        
        let formula = Formula(operands: operands, operators: operators)

        return formula
    }

    private static func componentsByOperators(from input: String) -> [String] {
        var numberString = input
        
        Operator.allCases.forEach {
            guard let numberArrayWithBlank = numberString.split(with: $0.rawValue).first else {return}
            numberString = numberArrayWithBlank
        }
        
        let numberArray = numberString.components(separatedBy: " ")
        
        return numberArray
    }
}
