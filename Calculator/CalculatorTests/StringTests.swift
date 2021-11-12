//
//  StringTests.swift
//  CalculatorTests
//
//  Created by 이호영 on 2021/11/13.
//

import XCTest
@testable import Calculator

class StringTests: XCTestCase {

    func test_string값을_character를_가지고_split하면_String배열로_반환한다() {
        let stringValue:String = "+1"
        
        let result = stringValue.split(with: "+")
        
        XCTAssertEqual(result, ["+"])
    }

}
