//
//  FormulaTests.swift
//  CalculatorTests
//
//  Created by yonggeun Kim on 2022/09/25.
//

import XCTest
@testable import Calculator

final class FormulaTests: XCTestCase {
    var sut: Formula!
    var operands = CalculatorItemQueue<Double>()
    var operators = CalculatorItemQueue<Operator>()
    
    override func setUpWithError() throws {
        try super.setUpWithError()
        sut = Formula(operands: operands, operators: operators)
        sut.operands.clear()
        sut.operators.clear()
    }
    
    func test_덧셈이_연산되었을때_input된_수들의_더하기와_동일해야한다() throws {
        // Given
        let testOperands: [Double] = [1.0, 2.0]
        let testOperators: [Operator] = [.add, .add, .add]
        
        // When
        testOperands.forEach{ sut.operands.enqueue(element: $0) }
        testOperators.forEach{ sut.operators.enqueue(element: $0) }
        
        // Then
        XCTAssertEqual(try sut.result(), 3.0)
    }

    func test_뺄셈이_연산되었을때_input된_수들의_빼기와_동일해야한다() throws {
        // Given
        let testOperands: [Double] = [20.0, 2.0, 3.0, 4.0]
        let testOperators: [Operator] = [.subtract, .subtract, .subtract]
        
        // When
        testOperands.forEach{ sut.operands.enqueue(element: $0) }
        testOperators.forEach{ sut.operators.enqueue(element: $0) }
        
        // Then
        XCTAssertEqual(try sut.result(), 11.0)
    }
    
    func test_곱셈이_연산되었을때_input된_수들의_곱과_동일해야한다() throws {
        // Given
        let testOperands: [Double] = [1.0, 2.0, 3.0, 4.0]
        let testOperators: [Operator] = [.multiply, .multiply, .multiply]
        
        // When
        testOperands.forEach{ sut.operands.enqueue(element: $0) }
        testOperators.forEach{ sut.operators.enqueue(element: $0) }
        
        // Then
        XCTAssertEqual(try sut.result(), 24.0)
    }
    
    func test_나눗셈이_연산되었을때_input된_수들의_나누기와_동일해야한다() throws {
        // Given
        let testOperands: [Double] = [100.0, 2.0, 5.0, 4.0]
        let testOperators: [Operator] = [.divide, .divide, .divide]
        
        // When
        testOperands.forEach{ sut.operands.enqueue(element: $0) }
        testOperators.forEach{ sut.operators.enqueue(element: $0) }
        
        // Then
        XCTAssertEqual(try sut.result(), 2.5)
    }
    
    func test_덧셈_뺄셈_곱셈_나눗셈연산이_각각_연산되었을때_input된_수들의_각각연산과_동일해야함() throws {
        // Given
        let testOperands: [Double] = [10.0, 20.0, 5.0, -15.0, 7.5]
        let testOperators: [Operator] = [.add, .subtract, .multiply, .divide]
        
        // When
        testOperands.forEach{ sut.operands.enqueue(element: $0) }
        testOperators.forEach{ sut.operators.enqueue(element: $0) }
        
        // Then
        XCTAssertEqual(try sut.result(), -50)
    }
}
