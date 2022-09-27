//
//  ExpressionParserTests.swift
//  ExpressionParserTests
//
//  Created by Dylan_Y on 2022/09/27.
//

import XCTest
@testable import Calculator

final class ExpressionParserTests: XCTestCase {
    var sut: ExpressionParser!
    
    override func setUpWithError() throws {
        try super.setUpWithError()
    }

    override func tearDownWithError() throws {
        try super.tearDownWithError()
        sut = nil
    }
}
