
import Foundation

enum ExpressionParser {
    static func parse(from input: String) {
        let operators = Operation.allCases.map { String($0.rawValue) }
        var splitedByOperators = componentsByOperators(from: input)
        var operatorsInInput: [String] = []
        var OperandsInInput: [String] = []
        
        splitedByOperators.forEach{
            operators.contains($0) ? operatorsInInput.append($0) : OperandsInInput.append($0)
        }
//        return Formula(operands: <#T##CalculatorItemQueue<Character>#>, oprators: <#T##CalculatorItemQueue<Double>#>)
    }
    private static func componentsByOperators(from input: String) -> [String] {
       let operators = Operation.allCases.map{ $0.rawValue }
       var inputs: [String] = [input]
       
       for operand in operators {
           let inputsCount = inputs.count
           let indexOfFilteredByOperand: [Int] = ((0..<inputsCount).map { inputs[$0].contains(operand) ? $0 : nil}).compactMap { $0 }
           let filteredInputsByHavingOperand: [String] = inputs.filter { $0.contains(operand) }
           var splitedCount = 0
           
           for index in indexOfFilteredByOperand {
               splitedCount += 1
               let splitedByOperand = filteredInputsByHavingOperand[splitedCount - 1 ].split(with: operand)
               inputs.insert(contentsOf: splitedByOperand.flatMap{ $0 }, at: index)
               inputs.remove(at: index + splitedByOperand.count)
           }
       }
       
       return inputs
   }

}


