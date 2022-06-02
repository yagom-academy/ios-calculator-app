//
//  SplitTest.swift
//  CalculatorTest
//
//  Created by dhoney96 on 2022/06/02.
//

import XCTest

class SplitTest: XCTestCase {
    var sut: String = ""
     override func setUpWithError() throws {
         try super.setUpWithError()
         sut = "1-2+3*4"
     }

     override func tearDownWithError() throws {
         try super.tearDownWithError()
         sut = ""
     }

     func test_더하기연산자를기준으로split하면원하는결과값이나오는가() {
         //when
         sut = "1-2+3+4"

         //given
         let result = sut.split(separator: "+")

         //then
         XCTAssertEqual(result, ["1-2", "3", "4"])

     }

     func test_split을하고map고차함수를쓰면결과값이_subString에서_String으로매핑되어서결과를반환하는가() {
         //when
         sut = "1-2+3+4"

         //given
         let result = sut.split(separator: "+")
                         .map { String($0) }

         //then
         XCTAssertEqual(result, ["1-2", "3", "4"])
     }
}
