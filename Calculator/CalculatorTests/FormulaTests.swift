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
    
    func test_덧셈을_여러번했을때_덧셈된_양수값_출력되어야함() throws {
        // Given
        let testOperands: [Double] = [1.0, 2.0]
        let testOperators: [Operator] = [.add, .add, .add]
        
        // When
        testOperands.forEach{ sut.operands.enqueue(element: $0) }
        testOperators.forEach{ sut.operators.enqueue(element: $0) }
        
        // Then
        XCTAssertEqual(try sut.result(), 3.0)
    }
    
    func test_덧셈을_여러번했을때_덧셈된_음수값_출력되어야함() throws {
        // Given
        let testOperands: [Double] = [1.0, -2.0]
        let testOperators: [Operator] = [.add, .add, .add]
        
        // When
        testOperands.forEach{ sut.operands.enqueue(element: $0) }
        testOperators.forEach{ sut.operators.enqueue(element: $0) }
        
        // Then
        XCTAssertEqual(try sut.result(), -1.0)
    }


    func test_뺄셈을_여러번했을때_뺄셈된_값이_출력되어야함() throws {
        // Given
        let testOperands: [Double] = [20.0, 2.0, 3.0, 4.0]
        let testOperators: [Operator] = [.subtract, .subtract, .subtract]
        
        // When
        testOperands.forEach{ sut.operands.enqueue(element: $0) }
        testOperators.forEach{ sut.operators.enqueue(element: $0) }
        
        // Then
        XCTAssertEqual(try sut.result(), 11.0)
    }
    
    func test_곱셈을_여러번했을때_곱셈된_값이_출력되어야함() throws {
        // Given
        let testOperands: [Double] = [1.0, 2.0, 3.0, 4.0]
        let testOperators: [Operator] = [.multiply, .multiply, .multiply]
        
        // When
        testOperands.forEach{ sut.operands.enqueue(element: $0) }
        testOperators.forEach{ sut.operators.enqueue(element: $0) }
        
        // Then
        XCTAssertEqual(try sut.result(), 24.0)
    }
    
    func test_나눗셈을_여러번했을때_나눗셈된_소수점자리가포함된값이_출력되어야함() throws {
        // Given
        let testOperands: [Double] = [100.0, 2.0, 5.0, 4.0]
        let testOperators: [Operator] = [.divide, .divide, .divide]
        
        // When
        testOperands.forEach{ sut.operands.enqueue(element: $0) }
        testOperators.forEach{ sut.operators.enqueue(element: $0) }
        
        // Then
        XCTAssertEqual(try sut.result(), 2.5)
    }
    
    func test_덧셈_뺄셈_곱셈_나눗셈을_각각했을때_값이_출력되어야함() throws {
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
