//
//  OperatorTests.swift
//  CalculatorTests
//
//  Created by 박우연 on 2021/11/22.
//

import XCTest

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

    func test_when_case_is_add() {
        sut = .add
        
        XCTAssertEqual(try sut.calculate(lhs: 10, rhs: 4), 14)
    }
    
    func test_when_case_is_subtract() {
        sut = .subtract
        
        XCTAssertEqual(try sut.calculate(lhs: 10, rhs: 4), 6)
    }
    
    func test_when_case_is_divide() {
        sut = .divide
        
        XCTAssertEqual(try sut.calculate(lhs: 10, rhs: 4), 2.5)
    }
    
    func test_when_case_is_multiply() {
        sut = .multiply

        XCTAssertEqual(try sut.calculate(lhs: 10, rhs: 4), 40)
    }
}
