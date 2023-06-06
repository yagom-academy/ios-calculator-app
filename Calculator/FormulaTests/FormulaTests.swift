//
//  FormulaTests.swift
//  FormulaTests
//
//  Created by Erick on 2023/06/02.
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
    
    func test_피연산자에_2_3을_넣고_연산자에_add를_넣으면_result가_5를_반환합니다() {
        let input: Double = 2
        let input2: Double = 3
        sut.operands.enqueue(input)
        sut.operands.enqueue(input2)
        let inputOperator: Operator = .add
        sut.operators.enqueue(inputOperator)
        let expectation: Double = 5
        
        let result = sut.result()
        
        XCTAssertEqual(result, expectation)
    }
    
    func test_피연산자가_없을때_result가_0을_반환합니다() {
        let expectation: Double = 0
        
        let result = sut.result()
        
        XCTAssertEqual(result, expectation)
    }
    
    func test_연산자가_없을때_result가_피연산자를_반환합니다() {
        let input: Double = 5
        sut.operands.enqueue(input)
        let expectation: Double = 5
        
        let result = sut.result()
        
        XCTAssertEqual(result, expectation)
    }
    
    func test_두번째_피연산자가_없을때_result가_첫번째_피연산자를_반환합니다() {
        let input: Double = 5
        sut.operands.enqueue(input)
        let inputOperator: Operator = .add
        sut.operators.enqueue(inputOperator)
        let expectation: Double = 5
        
        let result = sut.result()
        
        XCTAssertEqual(result, expectation)
    }
    
    func test_0으로_나누면_result가_nan을_반환합니다() {
        let input: Double = 4
        let input2: Double = 0
        sut.operands.enqueue(input)
        sut.operands.enqueue(input2)
        let inputOperator: Operator = .divide
        sut.operators.enqueue(inputOperator)
                
        let result = sut.result().isNaN
        
        XCTAssertTrue(result)
    }
}
