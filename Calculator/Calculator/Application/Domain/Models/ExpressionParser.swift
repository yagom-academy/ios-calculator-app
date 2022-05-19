//
//  ExpressionParser.swift
//  Calculator
//
//  Created by Gordon Choi on 2022/05/19.
//

enum ExpressionParser {
    func parse(from input: String) -> Formula {
        var formula = Formula(operands: CalculatorItemQueue<Double>(), operators: CalculatorItemQueue<Operator>())
        let inputData = componentsByOperators(from: input)
        // TODO: 오퍼레이터와 숫자가 분리된 배열이 넘어오면 알맞은 큐에 넣어주는 작업을 수행한다
        
        return formula
    }
    
    private func componentsByOperators(from input: String) -> [String] {
        // TODO: 오퍼레이터와 숫자를 분리해준다
        return []
    }
}
