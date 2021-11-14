
import Foundation

enum ExpressionParser {
    func parse(from input: String) {
        
        
    }
    
    private func componentsByOperators(from input: String) -> [String] {
        let operators = Operation.allCases.map{ $0.rawValue }
        var inputs: [String] = [input]
        
        for operand in operators {
            let inputsCount = inputs.count
            let indexOfFilteredByOperand: [Int] = ((0..<inputsCount).map { inputs[$0].contains(operand) ? $0 : nil}).compactMap { $0 }
            let filteredInputsByHavingOperand: [String] = inputs.filter { $0.contains(operand) }
            
            for index in indexOfFilteredByOperand {
                let notSplitedIndex = indexOfFilteredByOperand[index]
                let splitedByOperand = filteredInputsByHavingOperand[index].split(with: operand)
                inputs.insert(contentsOf: splitedByOperand.flatMap{ $0 }, at: notSplitedIndex)
                inputs.remove(at: notSplitedIndex + splitedByOperand.count)
            }
        }
        
        return inputs
    }
}


