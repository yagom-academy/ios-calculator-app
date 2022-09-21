//
//  OperatorTests.swift
//  OperatorTests
//
//  Created by jin on 9/21/22.
//

import XCTest
@testable import Calculator

class OperatorTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func test_add_10_5() {
        
        let lhs: Double = 10
        let rhs: Double = 5
        
        let result = Operator.add.calculate(lhs: lhs, rhs: rhs)
        
        XCTAssertEqual(result, 15)
    }
    
    func test_subtract_10_5() {
        
        let lhs: Double = 10
        let rhs: Double = 5
        
        let result = Operator.subtract.calculate(lhs: lhs, rhs: rhs)

        XCTAssertEqual(result, 5)
    }
    
    func test_multiply_10_5() {
        
        let lhs: Double = 10
        let rhs: Double = 5
        
        let result = Operator.multiply.calculate(lhs: lhs, rhs: rhs)
        
        XCTAssertEqual(result, 50)
    }
    
    func test_divide_10_5() {
        
        let lhs: Double = 10
        let rhs: Double = 5
        
        let result = Operator.divide.calculate(lhs: lhs, rhs: rhs)
        
        XCTAssertEqual(result, 2)
    }

}
