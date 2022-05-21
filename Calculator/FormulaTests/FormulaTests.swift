//
//  FomularTests.swift
//  FomularTests
//
//  Created by Derrick kim on 2022/05/19.
//

import XCTest
@testable import Calculator

class FormulaTests: XCTestCase {
    var sut: Formula!
    var operands: CalculatorItemQueue<Double>!
    var operators: CalculatorItemQueue<Operator>!
    
    override func setUpWithError() throws {
        try super.setUpWithError()
        operands = CalculatorItemQueue<Double>()
        operators = CalculatorItemQueue<Operator>()
        sut = Formula(operands: operands, operators: operators)
    }
    
    override func tearDownWithError() throws {
        try super.tearDownWithError()
        operands = nil
        operators = nil
        sut = nil
    }
    
    func test_비연산자가_들어온다() {
        // given
        let array1: [Any] = [3.0, Operator.add,
                             2.0, Operator.multiply, 4.0]
        // when
        try array1
            .map{
                if let value = $0 as? Double {
                    operands.enqueue(value)
                }
            }
        
        let expectation = operands.peekFirst
        var result = sut.operands.peekFirst
        print(result)
        
        XCTAssertEqual(result, expectation)
    }
    
    func test_연산자가_들어온다() {
        // given
        let array1: [Any] = [3.0, Operator.add,
                             2.0, Operator.multiply, 4.0]
        // when
        try array1
            .map{
                if let value = $0 as? Operator {
                    operators.enqueue(value)
                }
            }
        
        let expectation = operators.peekFirst
        var result = sut.operators.peekFirst
        print(result)
        
        XCTAssertEqual(result, expectation)
    }
    
    func test_result값_20을_반환하다() {
        do {
            // given
            let array1: [Any] = [3.0, Operator.add,
                                 2.0, Operator.multiply, 4.0]
            let expectation = 20.0
            // when
            try array1
                .map{
                    if let value = $0 as? Operator {
                        operators.enqueue(value)
                    }
                    
                    if let value = $0 as? Double {
                        operands.enqueue(value)
                    }
                }
            
            var headOperand = try sut.operands.dequeue()
            
            while !sut.operands.isEmpty {
                let operandValue = try sut.operands.dequeue()
                let operatorValue = try sut.operators.dequeue()
                print(operatorValue)
                headOperand = try operatorValue.calculate(lhs: headOperand, rhs: operandValue)
            }
            
            XCTAssertEqual(headOperand, expectation)
        } catch {}
    }
    
    func test_result값_5을_반환하다() {
        do {
            // given
            let array1: [Any] = [4.0, Operator.multiply,
                                 5.0, Operator.divide, 4.0]
            let expectation = 5.0
            // when
            try array1
                .map{
                    if let value = $0 as? Operator {
                        operators.enqueue(value)
                    }
                    
                    if let value = $0 as? Double {
                        operands.enqueue(value)
                    }
                }
            
            var headOperand = try sut.operands.dequeue()
                        
            while !sut.operands.isEmpty {
                let operandValue = try sut.operands.dequeue()
                let operatorValue = try sut.operators.dequeue()
                       
                headOperand = try operatorValue.calculate(lhs: headOperand, rhs: operandValue)
            }
            
            XCTAssertEqual(headOperand, expectation)
        } catch {}
    }
}
