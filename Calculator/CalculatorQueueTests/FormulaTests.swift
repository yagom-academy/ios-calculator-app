//
//  FormulaTests.swift
//  CalculatorQueueTests
//
//  Created by Sunwoo on 2021/11/16.
//

import XCTest

class FormulaTests: XCTestCase {
    var formula = Formula()
    
    override func setUpWithError() throws {
        try super.setUpWithError()
    }

    override func tearDownWithError() throws {
        try super.tearDownWithError()
        formula.operators.removeAllItem()
        formula.operands.removeAllItem()
    }
    
    func test_숫자_4개의_덧셈을_잘_수행하는지() throws {
        [10, 20, 30, 40].forEach { number in
            formula.operands.enqueue(operation: number)
        }
        
        for _ in 1...3 {
            formula.operators.enqueue(operation: .add)
        }
        
        let calculationResult = try formula.result()
        
        XCTAssertEqual(100, calculationResult)
    }
    
    func test_숫자_4개의_곱셉을_잘_수행하는지() throws {
        [2, 3, 4, 5].forEach { number in
            formula.operands.enqueue(operation: number)
        }
        
        for _ in 1...3 {
            formula.operators.enqueue(operation: .multiply)
        }
        
        let calculationResult = try formula.result()
        
        XCTAssertEqual(120, calculationResult)
    }
    
    func test_숫자_4개의_뺼셈을_잘_수행하는지() throws {
        [10, 5, -2, 1].forEach { number in
            formula.operands.enqueue(operation: number)
        }
        
        for _ in 1...3 {
            formula.operators.enqueue(operation: .subtract)
        }
        
        let calculationResult = try formula.result()
        
        XCTAssertEqual(6, calculationResult)
    }
    
    func test_숫자_4개의_나눗셈을_잘_수행하는지() throws {
        [100, 5, -2, 5].forEach { number in
            formula.operands.enqueue(operation: number)
        }
        
        for _ in 1...3 {
            formula.operators.enqueue(operation: .divide)
        }
        
        let calculationResult = try formula.result()
        
        XCTAssertEqual(-2, calculationResult)
    }
    
    func test_0으로_나누었을_경우_오류를_검출하는지() throws {
        [10, 5, 0, 2].forEach { number in
            formula.operands.enqueue(operation: number)
        }
        
        for _ in 1...3 {
            formula.operators.enqueue(operation: .divide)
        }
  
        XCTAssertThrowsError(try formula.result())
    }
}

