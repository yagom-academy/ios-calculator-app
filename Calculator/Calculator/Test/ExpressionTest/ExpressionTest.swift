//
//  ExpressionTest.swift
//  ExpressionTest
//
//  Created by 김성준 on 2023/01/27.
//

import XCTest

@testable import Calculator
final class ExpressionTest: XCTestCase {

    var sut: String?
    
    override func setUpWithError() throws {
        sut = String()
    }

    override func tearDownWithError() throws {
        sut = nil
    }

    func test_split을_실행할때_파라미터를_기준으로_String이_배열로_나눠진다(){
        //given
        sut = "one,two,three"
        //when
        let result = sut?.split(with: ",")
        let expectation = ["one","two", "three"]
        //then
        XCTAssertEqual(result, expectation)
    }
}
