
import Foundation

enum ExpressionParser {
    func parse(from input: String) {
        
        
    }
    
    private func componentsByOperators(from input: String) -> [String] {
        let operators = Operation.allCases.map{ $0.rawValue }
        var inputs: [String] = [input]
        
        for operand in operators {
            let inputsCount = inputs.count
            let indexOfFilteredByOperand: [Int] = ((0..<inputsCount).map{ inputs[$0].contains(operand) ? $0 : nil}).compactMap{ $0 }
            let filteredInputsByOperand: [String] = inputs.filter{ $0.contains(operand) }
            for index in indexOfFilteredByOperand {
                let splitedByOperand = filteredInputsByOperand[index].split(with: operand)
                inputs[indexOfFilteredByOperand[index]] = splitedByOperand.reduce(" ", { $0 + $1 })
            }
        }
        
        return inputs
    }
}
