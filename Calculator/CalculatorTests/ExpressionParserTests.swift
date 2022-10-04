//  ExpressionParserTests.swift
//  Created by zhilly and Gundy on 2022/10/04.

import XCTest
@testable import Calculator

final class ExpressionParserTests: XCTestCase {
    
    override func setUpWithError() throws {
        try super.setUpWithError()
    }

    override func tearDownWithError() throws {
        try super.tearDownWithError()
    }
    
    func test_1더하기2곱하기3나누기4빼기5란수식을_parse메서드로전달했을때_formula의result가_마이너스2dot75인지() {
        //given
        let input: String = "1+2×3÷4−5"
        var formula: Formula = ExpressionParser.parse(from: input)
        
        //when
        let result = formula.result()
        
        //then
        XCTAssertEqual(result, -2.75)
    }
    
}
