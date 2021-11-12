//
//  FormulaTests.swift
//  Calculator
//
//  Created by Eunsoo KIM on 2021/11/12.
//

import XCTest
@testable import Calculator

class FormulaTests: XCTestCase {

    func test_1_더하기_2의_결과가_3인가() {
        var formula = Formula()
        formula.operands.enqueue(1.0)
        formula.operators.enqueue(Operator.add)
        
        var calculationResult = formula.result()
        
        XCTAssertEqual(3.0, calculationResult)
    }
}
