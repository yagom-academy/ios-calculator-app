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
    
    func test_Operator_add에_0점4_0점1을_더하면_0점5가_되는지() throws {
        sut = .add
        let result = try sut.calculate(lhs: 0.4, rhs: 0.1)
        
        XCTAssertEqual(result, 0.5)
    }
    
    func test_Operator_subtract에_5에서_1을_빼면_4가_나오는지() throws {
        sut = .subtract
        let result = try sut.calculate(lhs: 5, rhs: 1)
        
        XCTAssertEqual(result, 4)
    }

    func test_Operator_multiply에_2에서_0점2를_곱하면_0점4가_나오는지() throws {
        sut = .multiply
        let result = try sut.calculate(lhs: 2, rhs: 0.2)
        
        XCTAssertEqual(result, 0.4)
    }
    
    func test_Operator_divide에_4에서_2를_나누면_2가_나오는지() throws {
        sut = .divide
        let result = try sut.calculate(lhs: 4, rhs: 2)
        
        XCTAssertEqual(result, 2)
    }
    
    func test_Operator_divide에서_0으로_나눴을때_에러가_발생하는지() throws  {
        sut = .divide
        
        XCTAssertThrowsError(try sut.calculate(lhs: 4, rhs: 0))
    }
}
