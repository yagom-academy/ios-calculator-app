//
//  ExpressionParserTests.swift
//  CalculatorTests
//
//  Created by 이호영 on 2021/11/12.
//

import XCTest
@testable import Calculator

class ExpressionParserTests: XCTestCase {

//    var queue: CalculatorItemQueue?
//
//    override func setUpWithError() throws {
//        queue = CalculatorItemQueue()
//    }
//
//    override func tearDownWithError() throws {
//        queue = nil
//    }

    func test_tt() {
        let String = "15*-1+0.4"
        
        ExpressionParser.parse(from: String)
    }

}
