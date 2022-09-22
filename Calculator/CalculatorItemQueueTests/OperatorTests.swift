//
//  OperatorTests.swift
//  CalculatorItemsTests
//
//  Created by 이경민 on 2022/09/22.
//

import XCTest
@testable import Calculator

final class OperatorTests: XCTestCase {
    
    func test_연산자가add일때에러없이연산을수행하는지() {
        // driven
        let targetOperator = Operator.add

        // when
        let result = try? targetOperator.calculate(lhs: 1, rhs: 2)

        // then
        XCTAssertNoThrow(result)
        XCTAssertEqual(result, 3)
    }
    
    func test_연산자가subtract일때연산을잘수행하는지() {
        // driven
        let targetOperator = Operator.subtract
        
        // when
        let result = try? targetOperator.calculate(lhs: 2, rhs: 1)
        
        // then
        XCTAssertNoThrow(result)
        XCTAssertEqual(result, 1)
    }
    
    func test_연산자가multiply일때연산을잘수행하는지() {
        // driven
        let targetOperator = Operator.multiply
        
        // when
        let result = try? targetOperator.calculate(lhs: 2, rhs: 3)
        
        // then
        XCTAssertNoThrow(result)
        XCTAssertEqual(result, 6)
    }
    
    func test_연산자가divide일때0이아닌수로연산하였을때에러없이연산을잘수행하는지() {
        // driven
        let targetOperator = Operator.divide
        
        // when
        let result = try? targetOperator.calculate(lhs: 10, rhs: 2)
        
        // then
        XCTAssertNoThrow(result)
        XCTAssertEqual(result, 5)
    }
    
    func test_연산자가divide이고0인수로연산을수행하였을때에러가발생하는지() {
        // driven
        let targetOperator = Operator.divide
        
        // when then
        XCTAssertThrowsError(try targetOperator.calculate(lhs: 10, rhs: 0))
    }
}
