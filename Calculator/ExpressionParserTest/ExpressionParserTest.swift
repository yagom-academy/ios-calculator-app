//
//  ExpressionParserTest.swift
//  ExpressionParserTest
//
//  Created by 강민수 on 2023/01/27.
//

import XCTest

final class ExpressionParserTest: XCTestCase {
    
    var sut: String!

    override func setUpWithError() throws {
        try super.setUpWithError()
        sut = "+ 2"
    }

    override func tearDownWithError() throws {
        try super.tearDownWithError()
        sut = nil
    }
    
    func test_1더하기2의_문자열이_들어갈_경우_1과_2를_반환한다() {
    }
}
