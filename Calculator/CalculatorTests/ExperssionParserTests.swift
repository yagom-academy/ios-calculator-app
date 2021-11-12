//
//  ExperssionParserTests.swift
//  CalculatorTests
//
//  Created by 황제하 on 2021/11/12.
//

import XCTest

class ExperssionParserTests: XCTestCase {
    var sut: ExpressionParser.Type!
    
    override func setUpWithError() throws {
        sut = ExpressionParser.self
    }

    override func tearDownWithError() throws {
        sut = nil
    }
    
}
