//
//  Operator_Test.swift
//  ModelTests
//
//  Created by Red on 2022/03/18.
//

import XCTest
@testable import Calculator

class Operator_Test: XCTestCase {

    override func setUpWithError() throws {
    }
    
    override func tearDownWithError() throws {
    }
                                                                                    
    func test_operator_calculate_add() {
        let result = Operator.add.calculate(lhs: 1.0, rhs: 2.2)
        XCTAssertEqual(result, 3.2)
    }
    
    func test_operator_calculate_subtract() {
        let result = Operator.subtract.calculate(lhs: 10.8, rhs: 2.2)
        XCTAssertEqual(result, 10.8 - 2.2)
        //부동 소수점 오차 발생 가능
    }
    
    func test_operator_calculate_divide() {
        let result = Operator.divide.calculate(lhs: 10.0, rhs: 2.0)
        XCTAssertEqual(result, 5.0)
    }
    
    func test_operator_calculate_mutiply() {
        let result = Operator.multiply.calculate(lhs: 3.0, rhs: 2.0)
        XCTAssertEqual(result, 6.0)
    }
}
