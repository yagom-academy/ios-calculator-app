//
//  SplitTests.swift
//  SplitTests
//
//  Created by kimseongjun on 2023/01/27.
//

import XCTest
@testable import Calculator

final class SplitTests: XCTestCase {

    override func setUpWithError() throws {
        try super.setUpWithError()
    }

    override func tearDownWithError() throws {
        try super.tearDownWithError()
    }

    func test_split에_더하기를넣었을때_더하기를기준으로분리된_배열을반환한다() {
        //given
        let input = "12+13-24*24.4/3"
        let expectedValue = ["12", "13-24*24.4/3",]
        //when
        let result = input.split(with: "+")
        //then
        XCTAssertEqual(result, expectedValue)
        
    }

    func test_split에_빼기를넣었을때_빼기를기준으로분리된_배열을반환한다() {
        //given
        let input = "12+13-24*24.4/3"
        let expectedValue = ["12+13", "24*24.4/3"]
        
        //when
        let result = input.split(with: "-")
        
        //then
        XCTAssertEqual(result, expectedValue)
    }
    
    func test_split에_곱하기를넣었을때_곱하기를기준으로분리된_배열을반환한다() {
        //given
        let input = "12+13-24*24.4/3"
        let expectedValue = ["12+13-24", "24.4/3"]
        
        //when
        let result = input.split(with: "*")
        
        //then
        XCTAssertEqual(result, expectedValue)
    }
    
    func test_split에_나누기를넣었을때_나누기를기준으로분리된_배열을반환한다() {
        //given
        let input = "12+13-24*24.4/3"
        let expectedValue = ["12+13-24*24.4", "3"]
        
        //when
        let result = input.split(with: "/")
        
        //then
        XCTAssertEqual(result, expectedValue)
    }
}
