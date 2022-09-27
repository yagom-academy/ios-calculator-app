//
//  ExpressionParserTests.swift
//  ExpressionParserTests
//
//  Created by 정선아 on 2022/09/23.
//

import XCTest
@testable import Calculator

class ExpressionParserTests: XCTestCase {

    override func setUpWithError() throws {
       try super.setUpWithError()
    }

    override func tearDownWithError() throws {
        try super.tearDownWithError()
    }
    
    func test_10_더하기_20_곱하기_30_나누기_3은_300인가() throws {
        let string = "10 + 20 * 30 / 3"
        var parseTest = ExpressionParser.parse(from: string)
        let result = try parseTest.result()
        
        XCTAssertEqual(result, 300.0)
    }
}
