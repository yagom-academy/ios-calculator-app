//
//  OperatorTests.swift
//  CalculatorQueueTests
//
//  Created by Sunwoo on 2021/11/16.
//

import XCTest
@testable import Calculator
class OperatorTests: XCTestCase {
    var sut: Operator!
    override func setUpWithError() throws {
        try super.setUpWithError()
    }

    override func tearDownWithError() throws {
        try super.tearDownWithError()
        sut = nil
    }
    
    func test_Operator_add에_0점4_0점1을_더하면_0점5가_되는지 () {
        sut = .add
        let result = sut.calculate(lhs: 0.4, rhs: 0.1)
        
        XCTAssertEqual(result, 0.5)
    }
    
    func test_Operator_subtract에_5에서_1을_빼면_4가_나오는지() {
        sut = .subtract
        let result = sut.calculate(lhs: 5, rhs: 1)
        
        XCTAssertEqual(result, 4)
    }

    func test_Operator_multiply에_2에서_0점2를_곱하면_0점4가_나오는지() {
        sut = .multiply
        let result = sut.calculate(lhs: 2, rhs: 0.2)
        
        XCTAssertEqual(result, 0.4)
    }
}
