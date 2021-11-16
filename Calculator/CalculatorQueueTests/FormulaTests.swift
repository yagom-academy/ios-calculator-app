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
}

