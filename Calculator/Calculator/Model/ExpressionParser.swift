
import Foundation

enum ExpressionParser {
    
    static func parse(from input: String) -> Formula {
        let operators = Operator.allCases.map { String($0.rawValue) }
        let splitedByOperators = componentsByOperators(from: input)
        var operatorsInInput: [String] = []
        var operandsInInput: [String] = []
        
        splitedByOperators.forEach{
            operators.contains($0) ? operatorsInInput.append($0) : operandsInInput.append($0)
        }
        let formula = Formula()
        let operatorsInputWithoutNil = operatorsInInput.compactMap { Operator(rawValue: Character($0)) }
        operatorsInputWithoutNil.forEach {
            formula.operators.linkedList.enqueue(in: $0.rawValue )
        }
        operandsInInput.forEach {
            formula.operands.linkedList.enqueue(in: Double($0) ?? .zero)
        }
        
        return formula
    }
    
    private static func componentsByOperators(from input: String) -> [String] {
        let operators = Operator.allCases.map{ $0.rawValue }
        var inputs: [String] = [input]
        
        for operand in operators {
            let inputsCount = inputs.count
            let indexOfFilteredByOperand: [Int] = ((0..<inputsCount).map { inputs[$0].contains(operand) ? $0 : nil}).compactMap { $0 }
            let filteredInputsByHavingOperand: [String] = inputs.filter { $0.contains(operand) }
            var splitedCount = 0
            
            for index in indexOfFilteredByOperand {
                splitedCount += 1
                let splitedByOperand = filteredInputsByHavingOperand[splitedCount - 1 ].split(with: operand)
                inputs.insert(contentsOf: splitedByOperand.flatMap { $0 }, at: index)
                inputs.remove(at: index + splitedByOperand.count)
            }
        }
        
        return inputs
    }
    
}


