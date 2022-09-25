//
//  OperatorTests.swift
//  Created by Wonbi
//

import XCTest
@testable import Calculator

class OperatorTests: XCTestCase {
    func test_add에랜덤한두값을입력했을때_결과가두값의합으로나오는지() {
        let lhs = Double.random(in: -100.0...100.0)
        let rhs = Double.random(in: -100.0...100.0)
        
        let result = Operator.add.calculate(lhs: lhs, rhs: rhs)
        
        XCTAssertEqual(lhs + rhs, result)
    }
    
    func test_subtract에랜덤한두값을입력했을때_결과가두값의차로나오는지() {
        let lhs = Double.random(in: -100.0...100.0)
        let rhs = Double.random(in: -100.0...100.0)
        
        let result = Operator.subtract.calculate(lhs: lhs, rhs: rhs)
        
        XCTAssertEqual(lhs - rhs, result)
    }
    
    func test_divide에랜덤한두값을입력했을때_결과가두값을나눈값으로나오는지() {
        let lhs = Double.random(in: -100.0...100.0)
        let rhs = Double.random(in: -100.0...100.0)
        
        let result = Operator.divide.calculate(lhs: lhs, rhs: rhs)
        
        XCTAssertEqual(lhs / rhs, result)
    }
    
    func test_multiply에랜덤한두값을입력했을때_결과가두값을곱한값으로나오는지() {
        let lhs = Double.random(in: -100.0...100.0)
        let rhs = Double.random(in: -100.0...100.0)
        
        let result = Operator.multiply.calculate(lhs: lhs, rhs: rhs)
        
        XCTAssertEqual(lhs * rhs, result)
    }
    
    func test_divide의rhs에0을입력했을때_NaN이나오는지() {
        let lhs = Double.random(in: -100.0...100.0)
        let rhs: Double = 0
        
        let result = Operator.divide.calculate(lhs: lhs, rhs: rhs)
        
        XCTAssertTrue(result.isNaN)
    }
}
