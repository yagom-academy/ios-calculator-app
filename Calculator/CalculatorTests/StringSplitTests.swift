//  StringSplitTests.swift
//  Created by zhilly on 2022/09/26.

import XCTest
@testable import Calculator

final class StringSplitTests: XCTestCase {
  
    func test_1더하기1을split했을때_결과가1_1인지() {
        //given
        let str = "1+1"
        
        //when
        let result = str.split(with: Operator.add.rawValue)
        
        //then
        XCTAssertEqual(result, ["1", "1"])
    }
    
    func test_1더하기2더하기3을split했을때_결과가1_2_3_인지() {
        //given
        let str = "1+2+3"
        
        //when
        let result = str.split(with: Operator.add.rawValue)
        
        //then
        XCTAssertEqual(result, ["1", "2", "3"])
    }
    
    func test_4곱하기5를split했을때_결과가4_5인지() {
        //given
        let str = "4*5"
        
        //when
        let result = str.split(with: Operator.multiply.rawValue)
        
        //then
        XCTAssertEqual(result, ["4", "5"])
    }
}
