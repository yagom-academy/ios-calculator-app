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
}
