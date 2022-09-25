//
//  ExpressionParserTests.swift
//  ExpressionParserTests
//
//  Created by 노유빈 on 2022/09/23.
//

import XCTest

@testable import Calculator
final class ExpressionParserTests: XCTestCase {
    
    override func setUpWithError() throws {
        try super.setUpWithError()
    }
    
    override func tearDownWithError() throws {
        try super.tearDownWithError()
    }
    
    func test_더하기_string타입_식이_주어지면_파싱하여_결과가_나오는지_확인() {
        let stringFormula = "123+25+30"

        var structFormula = ExpressionParser.parser(from: stringFormula)
        let result = try! structFormula.result()

        XCTAssertEqual(result, 178)
    }
    
    func test_빼기_string타입_식이_주어지면_파싱하여_결과가_나오는지_확인() {
        let stringFormula = "153-78-15"
        
        var structFormula = ExpressionParser.parser(from: stringFormula)
        let result = try! structFormula.result()
       
        XCTAssertEqual(result, 60)
    }
    
    
    
    func test_곱하기_string타입_식이_주어지면_파싱하여_결과가_나오는지_확인() {
        let stringFormula = "12×25×78×4"
        
        var structFormula = ExpressionParser.parser(from: stringFormula)
        let result = try! structFormula.result()
       
        XCTAssertEqual(result, 93600)
    }
    
    func test_나누기_string타입_식이_주어지면_파싱하여_결과가_나오는지_확인() {
        let stringFormula = "78÷4÷3"
        
        var structFormula = ExpressionParser.parser(from: stringFormula)
        let result = try! structFormula.result()
       
        XCTAssertEqual(result, 6.5)
    }
    
    func test_혼합_string타입_식이_주어지면_파싱하여_결과가_나오는지_확인() {
        let stringFormula = "123+25-78÷4×5"
        
        var structFormula = ExpressionParser.parser(from: stringFormula)
        let result = try! structFormula.result()
       
        XCTAssertEqual(result, 87.5)
    }
}
