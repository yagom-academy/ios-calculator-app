//
//  OperatorTests.swift
//  CalculatorItemsTests
//
//  Created by 이경민 on 2022/09/22.
//

import XCTest
@testable import Calculator

final class OperatorTests: XCTestCase {
    var lhs: Double!
    var rhs: Double!
    
    override func setUpWithError() throws {
        lhs = Double.random(in: -99999999...99999999)
        rhs = Double.random(in: -99999999...99999999)
    }
    
    func test_연산자가add일때에러없이연산을수행하는지() {
        // driven
        let targetOperator = Operator.add

        // when
        let result = try? targetOperator.calculate(lhs: lhs, rhs: rhs)

        // then
        XCTAssertNoThrow(result)
        XCTAssertEqual(result, (lhs + rhs))
    }
    
    func test_연산자가subtract일때에러없이연산을잘수행하는지() {
        // driven
        let targetOperator = Operator.subtract
        
        // when
        let result = try? targetOperator.calculate(lhs: lhs, rhs: rhs)
        
        // then
        XCTAssertNoThrow(result)
        XCTAssertEqual(result, (lhs - rhs))
    }
    
    func test_연산자가multiply일때연산을잘수행하는지() {
        // driven
        let targetOperator = Operator.multiply
        
        // when
        let result = try? targetOperator.calculate(lhs: lhs, rhs: rhs)
        
        // then
        XCTAssertNoThrow(result)
        XCTAssertEqual(result, (lhs * rhs))
    }
    
    func test_연산자가divide일때0이아닌수로연산하였을때에러없이연산을잘수행하는지() {
        // driven
        let targetOperator = Operator.divide
        
        // when
        if rhs == 0 { rhs = 1 }
        let result = try? targetOperator.calculate(lhs: lhs, rhs: rhs)
        
        // then
        XCTAssertNoThrow(result)
        XCTAssertEqual(result, (lhs / rhs))
    }
    
    func test_연산자가divide이고0인수로연산을수행하였을때에러가발생하는지() {
        // driven
        let targetOperator = Operator.divide
        
        // when
        let lhs: Double = 10
        let rhs: Double = 0
        
        // then
        XCTAssertThrowsError(try targetOperator.calculate(lhs: lhs, rhs: rhs))
    }
}
