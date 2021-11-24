//
//  ExpressionParserTests.swift
//  CalculatorTests
//
//  Created by 권나영 on 2021/11/14.
//

import XCTest
@testable import Calculator

class ExpressionParserTests: XCTestCase {
    var sut: ExpressionParser.Type!
    
    override func setUpWithError() throws {
        try super.setUpWithError()
        sut = ExpressionParser.self
    }

    override func tearDownWithError() throws {
        try super.tearDownWithError()
        sut = nil
    }
    
    func test_parse메서드로_피연산자가_잘나누어지는지() {
        var operands = sut.parse(from: "1+2−3×4÷5").operands
        
        [1.0, 2.0, 3.0, 4.0, 5.0].forEach { element in
            XCTAssertEqual(element, try! operands.dequeue())
        }
    }
    
    func test_parse메서드로_연산자가_잘나누어지는지() {
        var operators = sut.parse(from: "1+2−3×4÷5").operators
        
        [Operator.add, Operator.subtract, Operator.multiply, Operator.divide].forEach { element in
            XCTAssertEqual(element, try! operators.dequeue())
        }
    }
}
