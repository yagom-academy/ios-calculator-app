//
//  StringExtensionTests.swift
//  StringExtensionTests
//
//  Created by 이태영 on 2022/09/26.
//

import XCTest
@testable import Calculator

class StringExtensionTests: XCTestCase {
    func testSplit_문자하나를입력받고_해당문자를기준으로쪼갠문자열을요소로가진배열을반환해야한다() {
        // given
        let input = "1+2+3"
        // when
        let result = input.split(with: "+")
        // then
        XCTAssertEqual(result, ["1", "+", "2", "+", "3"])
    }
}
