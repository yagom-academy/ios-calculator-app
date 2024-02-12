//
//  FormulaTests.swift
//  CalculatorTests
//
//  Created by Jaehun Lee on 2/12/24.
//

import XCTest
@testable import Calculator

final class FormulaTests: XCTestCase {
    var sut: Formula!
    
    override func setUpWithError() throws {
        sut = Formula(operands: CalculatorItemQueue<Double>(), operators: CalculatorItemQueue<Operator>())
    }
    
    override func tearDownWithError() throws {
        sut = nil
    }
    
    func test_ResultOfFormula() {
        // Given
        let operandsArr = [120.0, 3.0, 20.0, 10.0, 4.0, 2.0]
        let operatorsArr: [Operator] = [.divide, .add, .subtract, .multiply, .divide]
        operandsArr.forEach { sut.operands.enqueue(element: $0) }
        operatorsArr.forEach { sut.operators.enqueue(element: $0) }
        let expectedValue = 100.0
        
        // Then
        XCTAssertEqual(expectedValue, try sut.result())
    }
    
    func test_DivisionByZeroOfFormula() {
        // Given
        let operandsArr = [1.0, 0.0]
        let operatorsArr: [Operator] = [.divide]
        
        // Then
        XCTAssertThrowsError(try sut.result())
    }
}
