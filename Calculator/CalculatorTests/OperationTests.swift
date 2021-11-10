//
//  OperatorTests.swift
//  CalculatorTests
//
//  Created by 이승재 on 2021/11/10.
//

import XCTest

class OperationTests: XCTestCase {
    var operands: CalculatorItemQueue = CalculatorItemQueue<Double>()
    var operators: CalculatorItemQueue = CalculatorItemQueue<Operator>()
    
    override func setUp() {
        operands.enqueue(3.7)
        operands.enqueue(4.3)
        operands.enqueue(11.8)
    }
    
    override func tearDown() {
        operands = CalculatorItemQueue<Double>()
        operators = CalculatorItemQueue<Operator>()
    }
    
    func testAddAndSubtract() {
        guard let plus = Operator(rawValue: "+") else {
            return
        }
        guard let minus = Operator(rawValue: "-") else {
            return
        }
        operators.enqueue(plus)
        operators.enqueue(minus)
        guard let firstOperator = try? operators.dequeue() else {
            return
        }
        guard let secondOperator = try? operators.dequeue() else {
            return
        }
        guard let firstOperand = try? operands.dequeue() else {
            return
        }
        guard let secondOperand = try? operands.dequeue() else {
            return
        }
        guard let thirdOperand = try? operands.dequeue() else {
            return
        }
        
        let firstCalculatedAnswer = firstOperator.calculate(lhs: firstOperand, rhs: secondOperand)
        let finalCalculatedAnswer = secondOperator.calculate(lhs: firstCalculatedAnswer, rhs: thirdOperand)
        
        XCTAssertEqual(firstCalculatedAnswer, 3.7 + 4.3)
        XCTAssertEqual(finalCalculatedAnswer, 3.7 + 4.3 - 11.8)
    }
    
    func testDevideAndMultiply() {
        guard let solidus = Operator(rawValue: "/") else {
            return
        }
        guard let star = Operator(rawValue: "*") else {
            return
        }
        operators.enqueue(solidus)
        operators.enqueue(star)
        guard let firstOperator = try? operators.dequeue() else {
            return
        }
        guard let secondOperator = try? operators.dequeue() else {
            return
        }
        guard let firstOperand = try? operands.dequeue() else {
            return
        }
        guard let secondOperand = try? operands.dequeue() else {
            return
        }
        guard let thirdOperand = try? operands.dequeue() else {
            return
        }
        
        let firstCalculatedAnswer = firstOperator.calculate(lhs: firstOperand, rhs: secondOperand)
        let finalCalculatedAnswer = secondOperator.calculate(lhs: firstCalculatedAnswer, rhs: thirdOperand)
        
        XCTAssertEqual(firstCalculatedAnswer, 3.7 / 4.3)
        XCTAssertEqual(finalCalculatedAnswer, 3.7 / 4.3 * 11.8)
    }

}
