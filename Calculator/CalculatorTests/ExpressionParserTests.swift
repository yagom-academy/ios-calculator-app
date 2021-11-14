//
//  ExpressionParserTests.swift
//  CalculatorTests
//
//  Created by 양호준 on 2021/11/14.
//

import XCTest
@testable import Calculator

class ExpressionParserTests: XCTestCase {
//    func test_한가지_연산자만_있을_때_String_배열로_잘_분리되는지() {
//        XCTAssertEqual(ExpressionParser.componentsByOperators(from: "1+3"), ["1", "3"])
//    }
//    
//    func test_다양한_수에_한가지_연산자만_있을_때_String_배열로_잘_분리되는지() {
//        XCTAssertEqual(ExpressionParser.componentsByOperators(from: "1+3+4+6"), ["1", "3", "4", "6"])
//    }
//    
//    func test_다양한_수에_다양한_연산자가_있을_경우_잘_분리되는지() {
//        XCTAssertEqual(ExpressionParser.componentsByOperators(from: "1+3-4/1*3"), ["1", "3", "4", "1", "3"])
//    }
    
    var sut: Formula!
    
    override func setUpWithError() throws {
        try super.setUpWithError()
        
        sut = Formula(operands: CalculatorItemQueue(), operators: <#T##CalculatorItemQueue<Operator>#>)
    }
    
    func test_빈_String_일_경우_각각_빈_배열로_생성되는지() {
        ExpressionParser.parse(from: "")
        
        XCTAssertEqual(Formula, <#T##expression2: Equatable##Equatable#>)
    }
}
