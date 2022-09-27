//
//  StringSplitTests.swift
//  StringSplitTests
//
//  Created by Dylan_Y on 2022/09/27.
//

import XCTest
@testable import Calculator

final class StringSplitTests: XCTestCase {
    var sut: String!
    
    override func setUpWithError() throws {
        try super.setUpWithError()
    }

    override func tearDownWithError() throws {
        try super.tearDownWithError()
        sut = nil
    }
    
    func test_split_실행시_target에의해_반환값이_알맞게_들어오는지() {
        //given
        let givenString = "my name is 21"
        
        //when
        let result = givenString.split(with: " ")
        
        //then
        XCTAssertEqual(result, ["my", "name", "is", "21"])
    }
}
