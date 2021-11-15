//
//  OperatorTests.swift
//  CalculatorTests
//
//  Created by 권나영 on 2021/11/12.
//

import XCTest
@testable import Calculator

class OperatorTests: XCTestCase {
    var sut: Operator!

    override func setUpWithError() throws {
        try super.setUpWithError()
        sut = Operator(rawValue: "+")
    }

    override func tearDownWithError() throws {
        try super.tearDownWithError()
        sut = nil
    }

    func test_add케이스일때_15와_5를입력하면_20이나오는지() {
        sut = .add
        XCTAssertEqual(try sut.calculate(lhs: 15, rhs: 5), 20)
    }
    
    func test_subtract케이스일때_15와_5를입력하면_10이나오는지() {
        sut = .subtract
        XCTAssertEqual(try sut.calculate(lhs: 15, rhs: 5), 10)
    }
    
    func test_divide케이스일때_15와_5를입력하면_3이나오는지() {
        sut = .divide
        XCTAssertEqual(try sut.calculate(lhs: 15, rhs: 5), 3)
    }
    
    func test_multiply케이스일때_15와_5를입력하면_75가나오는지() {
        sut = .multiply
        XCTAssertEqual(try sut.calculate(lhs: 15, rhs: 5), 75)
    }
}
