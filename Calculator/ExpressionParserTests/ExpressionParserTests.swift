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
    
    func test_string타입_식이_주어지면_파싱하여_결과가_나오는지_확인() {
        let stringFormula = "123+25+30"
        
        var structFormula = ExpressionParser.parser(from: stringFormula)
        let result = try! structFormula.result()
        
        XCTAssertEqual(result, 178)
    }
}
