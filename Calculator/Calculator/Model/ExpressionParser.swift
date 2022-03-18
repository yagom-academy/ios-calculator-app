//
//  ExpressionParser.swift
//  Calculator
//
//  Created by marisol on 2022/03/18.
//

import Foundation

enum ExpressionParser {
    public func parse(from input: String) -> Formula {
        componentsByOperators(from: input)
    }
    
    private func componentsByOperators(from input: String) -> [String] {
        let stringArray = input.split(with: " ")
        var operandsArray:[String] = []
        var operatorsArray: [String] = []
        for index in 0..<stringArray.count {
            (index % 2) != 0 ? operandsArray.append(stringArray[index]) : operatorsArray.append(stringArray[index])
        }
        return operandsArray
    }
}
