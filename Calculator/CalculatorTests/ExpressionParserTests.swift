//
//  ExpressionParserTests.swift
//  CalculatorTests
//
//  Created by yeha on 2021/11/16.
//

import XCTest
@testable import Calculator

class ExpressionParserTests: XCTestCase {
    var sut: ExpressionParser.Type!

    override func setUp() {
        super.setUp()
        sut = ExpressionParser.self
    }

    override func tearDown() {
        super.tearDown()
        sut = nil
    }
}
