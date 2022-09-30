//
//  ExpressionParserTests.swift
//  CalculatorTests
//

import XCTest
@testable import Calculator

class ExpressionParserTests: XCTestCase {
    var sut: ExpressionParser.Type?
    
    let testCase1 = "ad1-fa2-214qs3-ㄹ"
    let testCase2 = "11/s*3a4+a-1243"
    let testCase3 = "1+sw10/sd/1a*s12f="
    let testCase4 = "12+3/a1s-12jsl"
    
    override func setUpWithError() throws {
        sut = ExpressionParser.self
    }

    override func tearDownWithError() throws {
        sut = nil
    }

    func test_parse함수실행시_Formula타입리턴하면_true() {
        guard let formula = sut?.parse(from: testCase1) else {
            XCTAssert(false)
            return
        }
        
        XCTAssert(type(of: formula) == Formula.self)
    }

}
