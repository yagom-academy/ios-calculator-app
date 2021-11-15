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
    func test_split_string_by_operators() {
        let input = "1+2*3"
        let result = sut.componentsByOperators(from: input)
        
        XCTAssertEqual(result, ["1", "2", "3"])
    }
    
    func test_정수와_음수가있는_문자열일때() {
        let input = "1+-3/4*-100"
        let result = sut.componentsByOperators(from: input)
        
        XCTAssertEqual(result, ["1", "-3", "4", "-100"])
    }
    
    func test_마이너스와_음수문자_구별하는지() {
        let input = "-3_-7_-9_5"
        let result = sut.componentsByOperators(from: input)
        
        XCTAssertEqual(result, ["-3", "-7", "-9", "5"])
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
