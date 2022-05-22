//
//  ExpressionPaserTest.swift
//  ExpressionPaserTest
//
//  Created by 오경식 on 2022/05/22.
//

import XCTest

@testable import Calculator

class ExpressionPaserTest: XCTestCase {

    override func setUpWithError() throws {
        try super.setUpWithError()
    }

    override func tearDownWithError() throws {
        try super.tearDownWithError()
    }
    
    func test_parse에_정상적인_식이_들어왔을_때_계산을_해주는지() {
        //given
        let inputExpresion = "1 + 2 * -3"
        
        // when
        let result = ExpressionPaser.parse(from: inputExpresion).result()
        
        // then
        XCTAssertEqual(result, -9.0)
    }

}
