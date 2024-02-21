//
//  FormulaTests.swift
//  CalculatorTests
//
//  Created by Danny on 2/20/24.
//

import Foundation

import XCTest
@testable import Calculator

final class FormulaTests: XCTestCase {
    var formulaSut: Formula!
    var operands: CalculatorItemQueue<Double>!
    var operators: CalculatorItemQueue<Operator>!
    
    override func setUpWithError() throws {
        try super.setUpWithError()
        operands = CalculatorItemQueue()
        operators = CalculatorItemQueue()
    }
    
    override func tearDownWithError() throws {
        try super.tearDownWithError()
        operands = nil
        operators = nil
    }
    
    func test_Formula_0으로_나눴을때_연산결과확인하기() {
        // Given
        let operandsDummy: [Double] = [1.0, 1.0, 0]
        let operatorsDummy: [Operator] = [Operator.add, Operator.divide]
        operandsDummy.forEach { operands.push($0) }
        operatorsDummy.forEach { operators.push($0) }
        let expectation: CalculatorError = CalculatorError.divideByZero
        formulaSut = Formula(operands: operands, operators: operators)
        
        do {
            // When
            _ = try formulaSut.result()
            XCTFail()
        } catch {
            guard let thrownError = error as? CalculatorError else {
                XCTFail()
                return
            }
            // Then
            XCTAssertEqual(expectation, thrownError)
        }
    }
    
    func test_Formula_정상적인값들어있을때_연산결과확인하기() {
        // Given
        let operandsDummy: [Double] = [1.0, 1.0]
        let operatorsDummy: [Operator] = [Operator.add]
        operandsDummy.forEach { operands.push($0) }
        operatorsDummy.forEach { operators.push($0) }
        let expectation = 2.0
        
        formulaSut = Formula(operands: operands, operators: operators)
        
        // Then
        try XCTAssertEqual(formulaSut.result(), expectation)
    }
    
    func test_Formula_정상적인값2들어있을때_연산결과확인하기() {
            // Given
            let operandsDummy: [Double] = [1.0, 1.0, 2.0, 3.0, 4.0]
            let operatorsDummy: [Operator] = [Operator.add, Operator.divide, Operator.multiply, Operator.subtract]
            operandsDummy.forEach { operands.push($0) }
            operatorsDummy.forEach { operators.push($0) }
            let expectation = -1.0
            
            formulaSut = Formula(operands: operands, operators: operators)
            
            // Then
            try XCTAssertEqual(formulaSut.result(), expectation)
        }
        
        func test_Formula_완전복잡한수식_연산결과확인하기() {
            // Given
            let operandsDummy: [Double] = [1.0, 1.0, 2.0, 3.0, 4.0, 100, 234, 11, 769]
            let operatorsDummy: [Operator] = [Operator.add, Operator.divide, Operator.multiply, Operator.subtract, Operator.multiply, Operator.add, Operator.divide, Operator.subtract]
            operandsDummy.forEach { operands.push($0) }
            operatorsDummy.forEach { operators.push($0) }
            let expectation = -756.8181818181819
            
            formulaSut = Formula(operands: operands, operators: operators)
            
            // Then
            try XCTAssertEqual(formulaSut.result(), expectation)
        }
}
