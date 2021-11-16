//
//  ExpressionParserTests.swift
//  CalculatorQueueTests
//
//  Created by Sunwoo on 2021/11/16.
//

import XCTest

class ExpressionParserTests: XCTestCase {
    var exampleData: String = " "
        
    override func setUpWithError() throws {
        try super.setUpWithError()
        exampleData = "12 * -3 + -3 / 9 ₋ 30 + 12"
    }

    override func tearDownWithError() throws {
        try super.tearDownWithError()
        exampleData = " "
    }

}
