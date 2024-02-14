//
//  ExpressionParserTests.swift
//  CalculatorTests
//
//  Created by Jaehun Lee on 2/12/24.
//

import XCTest
@testable import Calculator

final class ExpressionParserTests: XCTestCase {
    override func setUpWithError() throws {
        try super.setUpWithError()
    }

    override func tearDownWithError() throws {
        try super.tearDownWithError()
    }
    
    func test_Parse() {
        // Given
        let expression = "120.0/3.+-20−10.0*4.0/2.0"
        
        // When
        var resultFormula = ExpressionParser.parse(from: expression)
        var resultOperandsArr: [Double] = []
        var resultOperatorsArr: [Operator] = []
        
        while !resultFormula.operands.isEmpty {
            guard let operand = resultFormula.operands.dequeue() else {
                return
            }
            
            resultOperandsArr.append(operand)
        }
        
        while !resultFormula.operators.isEmpty {
            guard let `operator` = resultFormula.operators.dequeue() else {
                return
            }
            
            resultOperatorsArr.append(`operator`)
        }
        
        // Then
        XCTAssertEqual(expectedOperandsArr, resultOperandsArr)
        XCTAssertEqual(expectedOperatorsArr, resultOperatorsArr)
    }
}
