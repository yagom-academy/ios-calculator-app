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
        let formula = Formula()
        
        formula.operands.enqueue(1.0)
        formula.operands.enqueue(2.0)
        formula.operators.enqueue(Operator.add)
        
        let calculationResult = formula.result()
        print(calculationResult)
        
        XCTAssertEqual(3.0, calculationResult)
    }
}
