//
//  OperatorTests.swift
//  OperatorTests
//
//  Created by 이경민 on 2022/09/22.
//

import XCTest
@testable import Calculator

final class OperatorTests: XCTestCase {

    override func setUpWithError() throws {
    }

    override func tearDownWithError() throws {
    }

    func test_연산자가add일때연산을잘수행하는지() {
        // driven
        let targetOperator = Operator.add
        // when
        let result = targetOperator.calculate(lhs: 1, rhs: 2)
        // then
        XCTAssertEqual(result, 3)
    }

    func test_연산자가subtract일때연산을잘수행하는지() {
        let targetOperator = Operator.subtract
        
        let result = targetOperator.calculate(lhs: 2, rhs: 1)
        
        XCTAssertEqual(result, 1)
    }
    
    func test_연산자가multiply일때연산을잘수행하는지() {
        let targetOperator = Operator.multiply
        
        let result = targetOperator.calculate(lhs: 2, rhs: 3)
        
        XCTAssertEqual(result, 6)
    }
    
    func test_연산자가divide일때연산을잘수행하는지() {
        let targetOperator = Operator.divide
        
        let result = targetOperator.calculate(lhs: 10, rhs: 2)
        
        XCTAssertEqual(result, 5)
    }
    
}
