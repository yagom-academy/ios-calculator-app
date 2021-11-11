//
//  ExpressionParserTest.swift
//  CalculatorTests
//
//  Created by 박병호 on 2021/11/09.
//

import XCTest

class ExpressionParserTest: XCTestCase {

    func test_문자열_1_더하기_2는_3이다() {
        let inputString = "1 + 4"
        
        var parser = ExpressionParser.parse(from: inputString)
        
        try XCTAssertEqual(parser.result(), 5)
    }
    
    func test_문자열_1_더하기_2_나누기_3_더하기_4는_5이다() {
        let inputString = "1 + 2 / 3 + 4"
        
        var parser = ExpressionParser.parse(from: inputString)
        
        try XCTAssertEqual(parser.result(), 5)
    }
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

}
