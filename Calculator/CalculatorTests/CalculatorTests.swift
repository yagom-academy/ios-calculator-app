//
//  CalculatorTests.swift
//  CalculatorTests
//
//  Created by Danny on 2/5/24.
//

import XCTest
@testable import Calculator

final class CalculatorTests: XCTestCase {

    var sut: CalculatorItemQueue<String>!
    var formulaSut: Formula!
    var operands: CalculatorItemQueue<Double>!
    var operators: CalculatorItemQueue<Operator>!
    
    override func setUpWithError() throws {
        try super.setUpWithError()
        sut = CalculatorItemQueue()
        operands = CalculatorItemQueue()
        operators = CalculatorItemQueue()
    }

    override func tearDownWithError() throws {
        try super.tearDownWithError()
        sut = nil
        formulaSut = nil
        operands = nil
        operators = nil
    }

    func test_큐_요소개수파악이되는지테스트() throws {
        let dummy = ["3"]
        dummy.forEach { sut.enqueue($0) }
        let expection = 1
        
        let result = sut.count
        
        XCTAssertEqual(expection, result)
    }
    
    func test_큐_비어있는상태인지테스트() {
        let dummy = ["3"]
        dummy.forEach { sut.enqueue($0) }
        let expection = false
        
        let result: Bool = sut.isEmpty
        
        XCTAssertEqual(expection, result)
    }

    func test_큐_요소추가하기() {
        let dummy = ["3"]
        dummy.forEach { sut.enqueue($0) }
        
        let expectation: [String] = dummy
        
        let result = sut.showQueue()
        
        XCTAssertEqual(result, expectation)
    }
    
    func test_큐_요소제거하기_FirstOut() {
        let dummy = ["2", "+", "3"]
        dummy.forEach { sut.enqueue($0) }
        sut.dequeue()

        let expectation = "+"
        
        
        let result = sut.dequeue()
        
        XCTAssertEqual(result, expectation)
    }
    
    func test_Formula_0으로_나눴을때_연산결과확인하기() {
        // Given
        let operandsDummy: [Double] = [1.0, 1.0, 0]
        let operatorsDummy: [Operator] = [Operator.add, Operator.divide]
        operandsDummy.forEach { operands.enqueue($0) }
        operatorsDummy.forEach { operators.enqueue($0) }
        let expectation: CalculatorError = CalculatorError.divideOfZero
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
        operandsDummy.forEach { operands.enqueue($0) }
        operatorsDummy.forEach { operators.enqueue($0) }
        let expectation = 2.0
        
        formulaSut = Formula(operands: operands, operators: operators)
        
        try XCTAssertEqual(formulaSut.result(), expectation)
        
    }
    
    func test_ExpressionParser_parse메소드_결과() {
        formulaSut = ExpressionParser.parse(from: "123 + 234 +")
        
        let operandsDummy: [Double] = [123, 234]
        let operatorsDummy: [Operator] = [Operator.add, Operator.add]
        operandsDummy.forEach { operands.enqueue($0) }
        operatorsDummy.forEach { operators.enqueue($0) }
        
        let resultOfOperands: CalculatorItemQueue<Double> = formulaSut.operands
        let resultOfOperators: CalculatorItemQueue<Operator> = formulaSut.operators
        
        XCTAssertEqual(operands.showQueue(), resultOfOperands.showQueue())
        XCTAssertEqual(operators.showQueue(), resultOfOperators.showQueue())
    }
    
}
