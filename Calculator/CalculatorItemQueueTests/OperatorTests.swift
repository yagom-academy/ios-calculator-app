//
//  OperatorTests.swift
//  CalculatorItemsTests
//
//  Created by 이경민 on 2022/09/22.
//

import XCTest
@testable import Calculator

final class OperatorTests: XCTestCase {
    
    override func setUpWithError() throws {
        try super.setUpWithError()
    }
    
    override func tearDownWithError() throws {
        try super.tearDownWithError()
    }
    
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
        let targetOperator = Operator.subtract
        
        let result = try? targetOperator.calculate(lhs: 2, rhs: 1)
        
        XCTAssertNoThrow(result)
        XCTAssertEqual(result, 1)
    }
    
    func test_연산자가multiply일때연산을잘수행하는지() {
        let targetOperator = Operator.multiply
        
        let result = try? targetOperator.calculate(lhs: 2, rhs: 3)
        
        XCTAssertNoThrow(result)
        XCTAssertEqual(result, 6)
    }
    
    func test_연산자가divide일때연산을잘수행하는지() {
        let targetOperator = Operator.divide
        
        let result = try? targetOperator.calculate(lhs: 10, rhs: 2)
        
        XCTAssertNoThrow(result)
        XCTAssertEqual(result, 5)
    }
    
}
