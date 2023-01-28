//  CalculatorItemQueueTests - SplitTests.swift
//  created by vetto on 2023/01/28

import Foundation

import XCTest
@testable import Calculator

final class SplitTests: XCTestCase {
    var sut: String?
    
    override func setUpWithError() throws {
        try super.setUpWithError()
    }
    
    override func tearDownWithError() throws {
        try super.tearDownWithError()
        
        sut = nil
    }
    
    func test_테스트문자열에서_split_with에_Characater_blank를_넣고_호출하면_빈_문자열배열이_반환된다() {
        // given
        sut = ""
        
        // when
        let result = sut?.split(with: " ")
        let expectation: [String] = []
        
        // then
        XCTAssertEqual(result, expectation)
    }
    
    func test_테스트문자열에서_split_with에_Characater_blank를_넣고_호출하면_blank로_분리된_배열이_반환된다() {
        // given
        sut = "test test test"
        
        // when
        let result = sut?.split(with: " ")
        let expectation: [String] = ["test", "test", "test"]
        
        // then
        XCTAssertEqual(result, expectation)
    }
    
    func test_테스트문자열에서_split_with에_Characater_더하기를_넣고_호출하면_더하기로_분리된_문자열배열이_반환된다() {
        // given
        sut = "123+456+789"
        
        // when
        let result = sut?.split(with: "+")
        let expectation: [String] = ["123", "456", "789"]
        
        // then
        XCTAssertEqual(result, expectation)
    }
    
    func test_테스트문자열에서_split_with에_Characater_7을_넣고_호출하면_7로_분리된_문자열배열이_반환된다() {
        // given
        sut = "127456789"
        
        // when
        let result = sut?.split(with: "7")
        let expecatation: [String] = ["12", "456", "89"]
        
        // then
        XCTAssertEqual(result, expecatation)
    }
}
