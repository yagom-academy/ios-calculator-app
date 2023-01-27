//
//  StringTest.swift
//  StringTest
//
//  Created by kaki on 2023/01/27.
//

import XCTest
@testable import Calculator

final class StringTest: XCTestCase {
    func test_char_기준으로_string을_split할_경우_string배열을_반환한다() {
        // given
        let str = "a+b+c"
        let char: Character = "+"
        // when
        let splitStr = str.split(with: char)
        let expectation: [String] = ["a", "b", "c"]
        // then
        XCTAssertEqual(splitStr, expectation)
    }
}
