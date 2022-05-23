//
//  ExpressionParser.swift
//  Calculator
//
//  Created by 허건 on 2022/05/19.
//
import Foundation

enum ExpressionParser {
    
    /// 파서해서 Formular에 데이터 보내는 함수 변환?? 파싱한다..
    static func parse(from input: String) -> Formula {
        let splitElements = componentsByOperators(from: input)
        var operandQueue = CalculatorItemQueue<Double>()
        var operatorQueue = CalculatorItemQueue<Operator>()
        
        for element in splitElements {
            if let doubleElements = Double(element) {
                operandQueue.enqueue(doubleElements)
                continue
            }
            
            if let operatorElements = Operator(rawValue: Character(element)) {
                operatorQueue.enqueue(operatorElements)
                continue
            }
        }
        
        return Formula(operands: operandQueue, operators: operatorQueue)
    }

    /// Operators의 구성요소
    static func componentsByOperators(from input: String) -> [String] {
        return input.split(with: " ")
    }
}
