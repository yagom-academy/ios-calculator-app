import Foundation

struct Formula {
    var operands = CalculatorItemQueue<Double>()
    var operators = CalculatorItemQueue<String>()
    
//    func result() -> Double {
//
//
//    }
}

extension String {
    func split(with target: Character) -> [String] {
        let splitedString = self.split(separator: target).map { String($0) }
        return splitedString
    }
}


enum ExpressionParser {
    static let operatorEnumArray = Operator.allCases.map { String($0.rawValue) }
    
    func parse(from input: String) -> Formula {
        var formula = Formula()
        
        let inputCharacters = Array(input).map { String($0) }
        let operandsArray = componentsByOperators(from: input)
        let operatorArray = inputCharacters.filter { ExpressionParser.operatorEnumArray.contains($0) == true }
        
        for operandIndex in 0...operandsArray.count {
            formula.operands.insertToQueue(Double(operandsArray[operandIndex]) ?? 0)
        }
        
        for operatorIndex in 0...operatorArray.count {
            formula.operators.insertToQueue(operatorArray[operatorIndex])
        }
         //입력받은 값 피연산자or연산자를 두개의 큐 중 적절한 큐에 저장
        return formula
    }

    private func componentsByOperators(from input: String) -> [String] {
        return input.components(separatedBy: ["+","-","/","*"])
        
    }
}

