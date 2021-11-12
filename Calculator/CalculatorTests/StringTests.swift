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
        
        XCTAssertEqual(result, ["+","1"])
    }
    
    func test_100의자리string값을_character를_가지고_split하면_String배열로_반환한다() {
        let stringValue:String = "+157"
        
        let result = stringValue.split(with: "+")
        
        XCTAssertEqual(result, ["+","157"])
    }
    
    func test_음수string값을_character를_가지고_split하면_String배열로_반환한다() {
        let stringValue:String = "-157"
        
        let result = stringValue.split(with: "-")
        
        XCTAssertEqual(result, ["-","157"])
    }
    
    func test_소수점string값을_character를_가지고_split하면_String배열로_반환한다() {
        let stringValue:String = "-157.123"
        
        let result = stringValue.split(with: "-")
        
        XCTAssertEqual(result, ["-","157.123"])
    }

}
