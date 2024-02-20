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
        
        try XCTAssertEqual(formulaSut.result(), expectation)
    }
}
