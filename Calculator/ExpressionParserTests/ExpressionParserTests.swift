//
//  ExpressionParserTests.swift
//  ExpressionParserTests
//
//  Created by kangkyungmin on 2023/06/07.
//

import XCTest
@testable import Calculator

final class ExpressionParserTests: XCTestCase {
    var sut: ExpressionParserTests!
    
    override func setUpWithError() throws {
        try super.setUpWithError()
        sut = ExpressionParserTests()
    }

    override func tearDownWithError() throws {
        try super.tearDownWithError()
        sut = nil
    }
}
