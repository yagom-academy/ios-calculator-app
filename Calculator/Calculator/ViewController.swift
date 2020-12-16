//
//  Calculator - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom. All rights reserved.
// 

import UIKit

class ViewController: UIViewController {
    var decimalExpressionAnalyzer = DecimalExpressionAnalyzer()
    let decimalTokenAnalyzer = DecimalTokenAnalyzer()
    let decimalCalculator = DecimalCalculator()
    
    let binaryExpressionAnalyzer = BinaryExpressionAnalyzer()
    let binaryTokenAnalyzer = BinaryTokenAnalyzer()
    let binaryCalculator = BinaryCalculator()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let decimalExpression = "12.23 + 34 * -45"
        let decimalTokenExpression = decimalExpressionAnalyzer.convertExpressionToToken(expression: decimalExpression)
        guard let decimalTokens = decimalTokenExpression else { return }
        let decimalPostfixExpression = decimalTokenAnalyzer.convertInfixToPostfix(tokenExpression: decimalTokens)
        guard let decimalPostfixTokens = decimalPostfixExpression else { return }
        let decimalCalculationResult = decimalCalculator.calculate(postfixTokenExpression: decimalPostfixTokens)
        if let result = decimalCalculationResult as? IntegerOperand {
            print("result: \(result.value)")
        } else if let result = decimalCalculationResult as? RealNumberOperand {
            print("result: \(result.value)")
        }
        
        let binaryExpression = "1010 + 101 - 111"
        let binaryTokenExpression = binaryExpressionAnalyzer.convertExpressionToToken(expression: binaryExpression)
        guard let binaryTokens = binaryTokenExpression else { return }
        let binaryPostfixExpression = binaryTokenAnalyzer.convertInfixToPostfix(tokenExpression: binaryTokens)
        guard let binaryPostfixTokens = binaryPostfixExpression else { return }
        let binaryCalculationResult = binaryCalculator.calculate(postfixTokenExpression: binaryPostfixTokens)
        if let result = binaryCalculationResult as? BinaryOperand {
            print("result: \(result.value)")
        }
    }


}

