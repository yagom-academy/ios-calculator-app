//
//  FormulaTests.swift
//  FormulaTests
//
//  Created by Prism, Hamzzi on 2/20/24.
//

import XCTest
@testable import Calculator

final class FormulaTests: XCTestCase {
    var sut: Formula!
    
    override func setUpWithError() throws {
        try super.setUpWithError()
        sut = Formula(operands: CalculatorItemQueue<Double>(), operators: CalculatorItemQueue<Operator>())
    }
    
    override func tearDownWithError() throws {
        try super.tearDownWithError()
        sut = nil
    }
    
    func test_ResultOfFormula() {
        // Given
        let operandsArr = [120.0, 3.0, 20.0, 10.0, 4.0, 2.0]
        let operatorsArr: [Operator] = [.divide, .add, .subtract, .multiply, .divide]
        operandsArr.forEach { sut.operands.enqueue($0) }
        operatorsArr.forEach { sut.operators.enqueue($0) }
        let expectedValue = 100.0
        
        // Then
        XCTAssertEqual(expectedValue, try sut.result())
    }
    
    func test_ResultOfFormulaWhenDividerIsZero() {
        // Given
        let operandsArr = [1.0, 0.0]
        let operatorsArr: [Operator] = [.divide]
        operandsArr.forEach { sut.operands.enqueue($0) }
        operatorsArr.forEach { sut.operators.enqueue($0) }
        let expectedError: CalculateError = .divisionByZero
        
        do {
            // When
            let _ = try sut.result()
            
            XCTFail()
        } catch {
            guard let thrownError = error as? CalculateError else { XCTFail(); return }
            
            // Then
            XCTAssertEqual(expectedError, thrownError)
        }
    }
    
    func test_OperandsIsEmpty() {
        // Given
        let operatorsArr: [Operator] = [.subtract]
        operatorsArr.forEach { sut.operators.enqueue($0) }
        let expectedError: CalculateError = .invalidFormula
        
        do {
            // When
            let _ = try sut.result()
            
            XCTFail()
        } catch {
            guard let thrownError = error as? CalculateError else { XCTFail(); return }
            
            // Then
            XCTAssertEqual(expectedError, thrownError)
        }
    }
    
    func test_OperatorsIsEmpty() {
        // Given
        let operandsArr = [1.0, 2.0]
        operandsArr.forEach { sut.operands.enqueue($0) }
        let expectedError: CalculateError = .invalidFormula
        
        do {
            // When
            let _ = try sut.result()
            
            XCTFail()
        } catch {
            guard let thrownError = error as? CalculateError else { XCTFail(); return }
            
            // Then
            XCTAssertEqual(expectedError, thrownError)
        }
    }
    
    func test_WierdFormula() {
        // Given
        let operandsArr = [1.0, 2.0]
        let operatorsArr: [Operator] = [.divide, .add, .subtract]
        operandsArr.forEach { sut.operands.enqueue($0) }
        operatorsArr.forEach { sut.operators.enqueue($0) }
        let expectedError: CalculateError = .invalidFormula
        
        do {
            // When
            let _ = try sut.result()
            
            XCTFail()
        } catch {
            guard let thrownError = error as? CalculateError else { XCTFail(); return }
            
            // Then
            XCTAssertEqual(expectedError, thrownError)
        }
    }
}
