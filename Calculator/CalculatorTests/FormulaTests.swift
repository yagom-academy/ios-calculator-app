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
    var operands: CalculatorItemQueue<Double>!
    var operators: CalculatorItemQueue<Operator>!
    
    override func setUpWithError() throws {
        try super.setUpWithError()
        operands = CalculatorItemQueue<Double>()
        operators = CalculatorItemQueue<Operator>()
        sut = Formula(operands: operands, operators: operators)
    }

    override func tearDownWithError() throws {
        try super.tearDownWithError()
    }

    func test_양수3개로_덧셈을_1번했을때_양수가_출력되어야함() throws {
        // Given
        let testOperands: [Double] = [1.0, 2.0, 3.0]
        let testOperators: [Operator] = [.add]
        
        // When
        testOperands.forEach{ sut.operands.enqueue(element: $0) }
        testOperators.forEach{ sut.operators.enqueue(element: $0) }
        
        // Then
        XCTAssertEqual(try sut.result(), 3.0)
    }
    
    func test_양수2개로_덧셈을_3번했을때_양수가_출력되어야함() throws {
        // Given
        let testOperands: [Double] = [1.0, 2.0]
        let testOperators: [Operator] = [.add, .add, .add]
        
        // When
        testOperands.forEach{ sut.operands.enqueue(element: $0) }
        testOperators.forEach{ sut.operators.enqueue(element: $0) }
        
        // Then
        XCTAssertEqual(try sut.result(), 3.0)
    }
    
    func test_양수4개로_덧셈을_3번했을때_양수가_출력되어야함() throws {
        // Given
        let testOperands: [Double] = [1.0, 2.0, 3.0, 4.0]
        let testOperators: [Operator] = [.add, .add, .add]
        
        // When
        testOperands.forEach{ sut.operands.enqueue(element: $0) }
        testOperators.forEach{ sut.operators.enqueue(element: $0) }
        
        // Then
        XCTAssertEqual(try sut.result(), 10.0)
    }
    
    func test_양수4개로_뺄셈을_3번했을때_음수가_출력되어야함() throws {
        // Given
        let testOperands: [Double] = [1.0, 2.0, 3.0, 4.0]
        let testOperators: [Operator] = [.subtract, .subtract, .subtract]
        
        // When
        testOperands.forEach{ sut.operands.enqueue(element: $0) }
        testOperators.forEach{ sut.operators.enqueue(element: $0) }
        
        // Then
        XCTAssertEqual(try sut.result(), -8.0)
    }
    
    func test_양수3개와_음수1개로_곱셈을_3번했을때_음수가_출력되어야함() throws {
        // Given
        let testOperands: [Double] = [1.0, 2.0, -3.0, 4.0]
        let testOperators: [Operator] = [.multiply, .multiply, .multiply]
        
        // When
        testOperands.forEach{ sut.operands.enqueue(element: $0) }
        testOperators.forEach{ sut.operators.enqueue(element: $0) }
        
        // Then
        XCTAssertEqual(try sut.result(), -24.0)
    }
    
    func test_양수3개와_음수1개로_나눗셈을_3번했을때_음수가_출력되어야함() throws {
        // Given
        let testOperands: [Double] = [10.0, 5.0, -2.0, 5.0]
        let testOperators: [Operator] = [.divide, .divide, .divide]
        
        // When
        testOperands.forEach{ sut.operands.enqueue(element: $0) }
        testOperators.forEach{ sut.operators.enqueue(element: $0) }
        
        // Then
        XCTAssertEqual(try sut.result(), -0.2)
    }
    
    func test_양수4개와_음수1개로_덧셈_뺄셈_곱셈_나눗셈을_각각1번했을때_음수가_출력되어야함() throws {
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
