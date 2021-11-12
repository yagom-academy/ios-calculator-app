//
//  OperatorTest.swift
//  CalculatorTests
//
//  Created by 이차민 on 2021/11/11.
//

import XCTest

class OperatorTest: XCTestCase {
    func test_양의_실수_두_개를_더하는_경우_정상적으로_연산되는지() {
        guard let calculator = Operator(rawValue: "+") else {
            return
        }
        
        let result = try calculator.calculate(lhs: 3.0, rhs: 4.5)
        XCTAssertEqual(7.5, result)
    }
    
    func test_양의_실수와_음의_실수를_더하는_경우_정상적으로_연산되는지() {
        guard let calculator = Operator(rawValue: "+") else {
            return
        }
        
        let result = try calculator.calculate(lhs: 3.0, rhs: -4.5)
        XCTAssertEqual(-1.5, result)
    }
    
    func test_음의_실수와_음의_실수를_더하는_경우_정상적으로_연산되는지() {
        guard let calculator = Operator(rawValue: "+") else {
            return
        }
        
        let result = try calculator.calculate(lhs: -3.0, rhs: -4.5)
        XCTAssertEqual(-7.5, result)
    }
    
    func test_양의_실수_두_개를_빼는_경우_정상적으로_연산되는지() {
        guard let calculator = Operator(rawValue: "-") else {
            return
        }
        
        let result = try calculator.calculate(lhs: 3.0, rhs: 4.5)
        XCTAssertEqual(-1.5, result)
    }
    
    func test_양의_실수와_음의_실수를_빼는_경우_정상적으로_연산되는지() {
        guard let calculator = Operator(rawValue: "-") else {
            return
        }
        
        let result = try calculator.calculate(lhs: 3.0, rhs: -4.5)
        XCTAssertEqual(7.5, result)
    }
    
    func test_음의_실수와_음의_실수를_빼는_경우_정상적으로_연산되는지() {
        guard let calculator = Operator(rawValue: "-") else {
            return
        }
        
        let result = try calculator.calculate(lhs: -3.0, rhs: -4.5)
        XCTAssertEqual(1.5, result)
    }
    
    func test_양의_실수_두_개를_곱하는_경우_정상적으로_연산되는지() {
        guard let calculator = Operator(rawValue: "*") else {
            return
        }
        
        let result = try calculator.calculate(lhs: 3.0, rhs: 4.0)
        XCTAssertEqual(12.0, result)
    }
    
    func test_양의_실수와_음의_실수를_곱하는_경우_정상적으로_연산되는지() {
        guard let calculator = Operator(rawValue: "*") else {
            return
        }
        
        let result = try calculator.calculate(lhs: 3.0, rhs: -4.0)
        XCTAssertEqual(-12.0, result)
    }
    
    func test_음의_실수와_음의_실수를_곱하는_경우_정상적으로_연산되는지() {
        guard let calculator = Operator(rawValue: "*") else {
            return
        }
        
        let result = try calculator.calculate(lhs: -3.0, rhs: -4.0)
        XCTAssertEqual(12.0, result)
    }
    
    func test_양의_우측_값이_양의_좌측_값을_나누는_경우_정상적으로_연산되는지() {
        guard let calculator = Operator(rawValue: "/") else {
            return
        }
        
        let result = try calculator.calculate(lhs: 3.0, rhs: 1.5)
        XCTAssertEqual(2.0, result)
    }
    
    func test_양의_우측_값이_음의_좌측_값을_나누는_경우_정상적으로_연산되는지() {
        guard let calculator = Operator(rawValue: "/") else {
            return
        }
        
        let result = try calculator.calculate(lhs: -3.0, rhs: 1.5)
        XCTAssertEqual(-2.0, result)
    }
    
    func test_음의_우측_값이_음의_좌측_값을_나누는_경우_정상적으로_연산되는지() {
        guard let calculator = Operator(rawValue: "/") else {
            return
        }
        
        let result = try calculator.calculate(lhs: -3.0, rhs: -1.5)
        XCTAssertEqual(2.0, result)
    }
    
    func test_0으로_값을_나누는_경우_값이_nan인지() {
        guard let calculator = Operator(rawValue: "/") else {
            return
        }
        
        let result = try calculator.calculate(lhs: -3.0, rhs: 0.0)
        XCTAssertTrue(result.isNaN)
    }
}
