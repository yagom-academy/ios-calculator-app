//
//  Formula_Tests.swift
//  CalculatorTests
//
//  Created by 1 on 2021/11/15.
//

import XCTest
@testable import Calculator

class Formula_Tests: XCTestCase {
    var sut: Formula!
    var testOperands: [Double] = []
    var testOperators: [Operator] = []
    
    func test_reult호출시_연산결과를_반환한다() {
        testOperands = [1.0, 2.0, -3.0, 4.0, 5.0]
        testOperators = [.add, .subtract, .divide, .multiply]
        let operands = CalculatorItemQueue(testOperands)
        let operators = CalculatorItemQueue(testOperators)
        sut = Formula(operands: operands, operators: operators)
        let result = sut.result()
        
        XCTAssertEqual(result, 7.5)
    }
}
