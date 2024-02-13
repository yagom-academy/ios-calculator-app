//
//  ExpressionParser.swift
//  Calculator
//
//  Created by Yejin Hong on 2024/02/13.
//

enum ExpressionParser {
//    func parse(from input: String) -> Formula {
//        return Formula(operands: <#T##CalculatorItemQueue<Double>#>, operators: <#T##CalculatorItemQueue<Operator>#>)
//    }
    
    private func componentsByOperators(from input: String) -> [String] {
        return [""]
    }
}

struct Formula {
    var operands: CalculatorItemQueue<Double>
    var operators: CalculatorItemQueue<Operator>

    func result() -> Double {
        return 0.0
    }
}

extension Double: CalculateItem {
    
}

extension String {
    func split(with target: Character) -> [String] {
        return [""]
    }
}
