//
//  StringExtensionTests.swift
//  StringExtensionTests
//
//  Created by 이태영 on 2022/09/26.
//

import XCTest
@testable import Calculator

class StringExtensionTests: XCTestCase {
    let numberFormatter = NumberFormatter()
    
    func testSplit_문자하나를입력받고_해당문자를기준으로쪼갠문자열을요소로가진배열을반환해야한다() {
        // given
        let input = "1+2+3"
        // when
        let result = input.split(with: "+")
        // then
        XCTAssertEqual(result, ["1", "+", "2", "+", "3"])
    }
    
    func testFormatStyleToDecimal_숫자표현이네자리이상일때_메서드를호출하면_세자리마다_콤마를표시해야한다() {
        //given
        let number = "1234"
        //when
        let result = number.formatStyleToDecimal(numberFormatter)
        //then
        XCTAssertEqual("1,234", result)
    }
    
    func testFormatStyleToDecimal_소수점뒤애불필요한0이있을때_메서드를호출하면_0을지워야한다() {
        //given
        let number = "34.0000"
        //when
        let result = number.formatStyleToDecimal(numberFormatter)
        //then
        XCTAssertEqual("34", result)
    }
    
    func testSplitByDot_정수에대하여_메서드를호출하면_정수부분을리턴해야한다() {
        //given
        let number = "123"
        //when
        let result = number.splitByDot()
        //then
        XCTAssertEqual("123", result.0)
    }
    
    func testSplitByDot_정수에대하여_메서드를호출하면_소수부분은빈문자열을리턴해야한다() {
        //given
        let number = "123"
        //when
        let result = number.splitByDot()
        //then
        XCTAssertEqual("", result.1)
    }
    
    func testSplitByDot_소수점아래숫자가없을때_메서드를호출하면_정수부분을리턴해야한다() {
        //given
        let number = "123."
        //when
        let result = number.splitByDot()
        //then
        XCTAssertEqual("123", result.0)
    }
    
    func testSplitByDot_소수점아래숫자가없을때_메서드를호출하면_소수부분은빈문자열을리턴해야한다() {
        //given
        let number = "123."
        //when
        let result = number.splitByDot()
        //then
        XCTAssertEqual("", result.1)
    }
    
    func testSplitByDot_숫자가소수점을포함할때_메서드를호출하면_정수부분을리턴해야한다() {
        //given
        let number = "123.456"
        //when
        let result = number.splitByDot()
        //then
        XCTAssertEqual("123", result.0)
    }
    
    func testSplitByDot_숫자가소수점을포함할때_메서드를호출하면_소수부분을리턴해야한다() {
        //given
        let number = "123.456"
        //when
        let result = number.splitByDot()
        //then
        XCTAssertEqual("456", result.1)
    }
}
