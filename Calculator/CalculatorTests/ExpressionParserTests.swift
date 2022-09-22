//
//  ExpressionParserTests.swift
//  ExpressionParserTests
//
//  Created by smfc on 22/9/2022.
//

import XCTest
@testable import Calculator

class ExpressionParserTests: XCTestCase {
    var sut: ExpressionParser!
    
    override func setUpWithError() throws {
        try super.setUpWithError()
        sut = ExpressionParser()
    }

    override func tearDownWithError() throws {
        try super.tearDownWithError()
        sut = nil
    }


}
