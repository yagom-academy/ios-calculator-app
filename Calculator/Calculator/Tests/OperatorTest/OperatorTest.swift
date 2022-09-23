//
//  OperatorTest.swift
//  OperatorTest
//
//  Created by Kyo on 2022/09/22.
//

import XCTest

@testable import Calculator
class OperatorTest: XCTestCase {
    
    var sut: Operator!

    override func tearDownWithError() throws {
        try super.tearDownWithError()
        sut = nil
    }

    func test_add() {
        sut = Operator(rawValue: "+")
        let result = sut.calculator(lhs: 10.0, rhs: 20.5)
        XCTAssertEqual(result, 30.5)
    }
    
    func test_subtract() {
        sut = Operator(rawValue: "-")
        let result = sut.calculator(lhs: 20.0, rhs: 10.0)
        XCTAssertEqual(result, 10.0)
    }
    
    func test_subtract_result_is_minus() {
        sut = Operator(rawValue: "-")
        let result = sut.calculator(lhs: 10.0, rhs: 20.0)
        XCTAssertEqual(result, -10.0)
    }
    
    func test_divide() {
        sut = Operator(rawValue: "/")
        let result = sut.calculator(lhs: 20.0, rhs: 10.0)
        XCTAssertEqual(result, 2.0)
    }
    
    func test_divide_result_is_under_zero() {
        sut = Operator(rawValue: "/")
        let result = sut.calculator(lhs: 10.0, rhs: 20.0)
        XCTAssertEqual(result, 0.5 )
    }
    
    func test_multifly() {
        sut = Operator(rawValue: "*")
        let result = sut.calculator(lhs: 10.0, rhs: 10.5)
        XCTAssertEqual(result, 105.0)
    }
    
    

}
