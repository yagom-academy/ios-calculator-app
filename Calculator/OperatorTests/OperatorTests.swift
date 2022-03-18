//
//  OperatorTests.swift
//  OperatorTests
//
//  Created by 김태현 on 2022/03/18.
//

import XCTest
@testable import Calculator

class OperatorTests: XCTestCase {
    override func setUpWithError() throws {
        try super.setUpWithError()
    }

    override func tearDownWithError() throws {
        try super.tearDownWithError()
    }

    func test_calculate_add_결과반환하는지() {
        let `operator` = Operator.add
        
        let result = `operator`.calculate(lhs: 1.0, rhs: 1.0)
        
        XCTAssertEqual(result, 2.0)
    }

    func test_calculate_subtract_결과반환하는지() {
        let `operator` = Operator.subtract
        
        let result = `operator`.calculate(lhs: 1.0, rhs: 1.0)
        
        XCTAssertEqual(result, 0)
    }
    
    func test_calculate_devide_결과반환하는지() {
        let `operator` = Operator.devide
        
        let result = `operator`.calculate(lhs: 1.0, rhs: 1.0)
        
        XCTAssertEqual(result, 1)
    }
    
    func test_calculate_multiply_결과반환하는지() {
        let `operator` = Operator.multiply
        
        let result = `operator`.calculate(lhs: 1.0, rhs: 1.0)
        
        XCTAssertEqual(result, 1)
    }
}
