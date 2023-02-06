//
//  CalculatorTests - StringTests.swift
//  Created by Rhode, Songjun.
//  Copyright © yagom. All rights reserved.
//

import XCTest
@testable import Calculator

final class StringTests: XCTestCase {

    override func tearDownWithError() throws {
        try super.tearDownWithError()
    }
    
    func test_character가더하기이고주어진문자열이1더하기2빼기3더하기4일때_split호출시_1과2빼기3과4가담긴배열을반환한다() {
        //given
        let character: Character = "+"
        let operandsAndOperators = "1+2−3+4"
        let expectedValue = ["1", "2−3", "4"]
        
        //when
        let result = operandsAndOperators.split(with: character)
        
        //then
        XCTAssertEqual(expectedValue, result)
    }
    
    func test_character가빼기이고주어진문자열이1빼기2곱하기3빼기4일때_split호출시_1과2곱하기3과4가담긴배열을반환한다() {
        //given
        let character: Character = "−"
        let operandsAndOperators = "1−2×3−4"
        let expectedValue = ["1", "2×3", "4"]
        
        //when
        let result = operandsAndOperators.split(with: character)
        
        //then
        XCTAssertEqual(expectedValue, result)
    }
    
    func test_character가곱하기이고주어진문자열이1곱하기2나누기3곱하기4일때_split호출시_1과2나누기3과4가담긴배열을반환한다() {
        //given
        let character: Character = "×"
        let operandsAndOperators = "1×2÷3×4"
        let expectedValue = ["1", "2÷3", "4"]
        
        //when
        let result = operandsAndOperators.split(with: character)
        
        //then
        XCTAssertEqual(expectedValue, result)
    }

    func test_character가나누기이고주어진문자열이1나누기2더하기3나누기4일때_split호출시_1과2더하기3과4가담긴배열을반환한다() {
        //given
        let character: Character = "÷"
        let operandsAndOperators = "1÷2+3÷4"
        let expectedValue = ["1", "2+3", "4"]
        
        //when
        let result = operandsAndOperators.split(with: character)
        
        //then
        XCTAssertEqual(expectedValue, result)
    }
}
