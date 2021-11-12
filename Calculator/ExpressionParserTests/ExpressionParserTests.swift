//
//  ExpressionParserTests.swift
//  ExpressionParserTests
//
//  Created by Jae-hoon Sim on 2021/11/12.
//

import XCTest
@testable import Calculator

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
}
