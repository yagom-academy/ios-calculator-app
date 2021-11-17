//
//  ExpressionParserTests.swift
//  CalculatorItemQueueTests
//
//  Created by 박우연 on 2021/11/16.
//

import XCTest

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
    
    //MARK: - componentsByOperators()
    func test_parse메서드를_호출했을때_정수와_음수가섞인_피연산자가_반환되는지() {
        var operands = sut.parse(from: "1+2_-3*4/5").operands
        
        [1.0, 2.0, -3.0, 4.0, 5.0].forEach { element in
            XCTAssertEqual(element, try! operands.deQueueFirstElement())
        }
    }
    
    //MARK: - parse()
    func test_parse메서드를_호출했을때_피연산자가_반환되는지() {
        var operands = sut.parse(from: "10+3_7*5/2").operands
        
        [10.0, 3.0, 7.0, 5.0, 2.0].forEach { element in
            XCTAssertEqual(element, try! operands.deQueueFirstElement())
        }
    }
    
    func test_parse메서드를_호출했을때_연산자가_반환되는지() {
        var operators = sut.parse(from: "10+3_7*5/2").operators
        
        [Operator.add, Operator.subtract, Operator.multiply, Operator.divide].forEach { element in
            XCTAssertEqual(element, try! operators.deQueueFirstElement())
        }
    }
}
