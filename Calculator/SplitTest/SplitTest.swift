//
//  SplitTest.swift
//  SplitTest
//
//  Created by 천승현 on 2023/01/27.
//

import XCTest
@testable import Calculator

final class SplitTest: XCTestCase {

    var sut: String!
    
    override func setUpWithError() throws {
        try super.setUpWithError()
        sut = ""
    }

    override func tearDownWithError() throws {
        try super.tearDownWithError()
        sut = nil
    }
    
    func test_split함수실행시_띄어쓰기를인자로넣는다면_띄어쓰기를기준으로분리해서_배열을반환한다() {
        // given
        sut = "a b c d e"
        let expectation = ["a", "b", "c", "d", "e"]
        
        // when
        let result = sut.split(with: " ")
        
        // then
        XCTAssertEqual(result, expectation)
    }
    
    func test_split함수실행시_마이너스를인자로넣는다면_마이너스를기준으로분리해서_배열을반환한다() {
        // given
        sut = "a-2+3-2*5"
        let expectation = ["a", "2+3", "2*5"]
        
        // when
        let result = sut.split(with: "-")
        
        // then
        XCTAssertEqual(result, expectation)
    }
    
    func test_split함수실행시_target이_연속하게들어가있는경우_연속된target을기준으로_분리가된다() {
        // given
        sut = "~~hello World~"
        let expectation = ["hello World"]
        
        // when
        let result = sut.split(with: "~")
        
        // then
        XCTAssertEqual(result, expectation)
    }
    
    func test_split함수실행시_target이_끝에있는경우_끝에있는target을기준으로_분리가된다() {
        // given
        sut = "~calculator project~"
        let expection = ["calculator project"]
        
        // when
        let result = sut.split(with: "~")
        
        // then
        XCTAssertEqual(result, expection)
    }
}
