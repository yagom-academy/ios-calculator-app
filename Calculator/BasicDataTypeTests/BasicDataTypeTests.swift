//
//  BasicDataTypeTests.swift
//  BasicDataTypeTests
//
//  Created by Ayaan on 2022/09/22.
//

import XCTest

class BasicDataTypeTests: XCTestCase {
    func testDouble_주어진_실수2를_CalculateItem_Type으로_Type_Checking한_경우_그_결과는_참이다() {
        //given
        let input: Double = 2.0
        
        //when
        let result: Bool = input is CalculateItem
        
        //then
        XCTAssertTrue(result)
    }
    
    func testString_주어진_String_Type_AaBaCaDaEaF를_오버로딩한_split메소드를_사용해_a를_기준으로_나눈_경우_그_결과는_A_a_B_a_C_a_D_a_E_a_F가_담긴_StringArray와_같다() {
        //given
        let input: String = "AaBaCaDaEaF"
        
        //when
        let result: [String] = input.split(with: "a")
        
        //then
        let answer: [String] = ["A", "a", "B", "a", "C", "a", "D", "a", "E", "a", "F"]
        XCTAssertEqual(answer, result)
    }

    func testString_주어진_String_Type_1더하기2더하기3을_오버로딩한_split메소드를_사용해_더하기를_기준으로_나눈_경우_그_결과는_1_더하기_2_더하기_3이_담긴_StringArray와_같다() {
        //given
        let input: String = "1+2+3"
        
        //when
        let result: [String] = input.split(with: "+")
        
        //then
        let answer: [String] = ["1", "+", "2", "+", "3"]
        XCTAssertEqual(answer, result)
    }
    
    func testString_주어진_String_Type_180빼기80빼기5을_오버로딩한_split메소드를_사용해_빼기를_기준으로_나눈_경우_그_결과는_180_빼기_80_빼기_5이_담긴_StringArray와_같다() {
        //given
        let input: String = "180−80−5"
        
        //when
        let result: [String] = input.split(with: "−")
        
        //then
        let answer: [String] = ["180", "−", "80", "−", "5"]
        XCTAssertEqual(answer, result)
    }
    
    func testString_주어진_String_Type_12곱하기2곱하기10을_오버로딩한_split메소드를_사용해_곱하기를_기준으로_나눈_경우_그_결과는_12_곱하기_5_곱하기_10이_담긴_StringArray와_같다() {
        //given
        let input: String = "12×5×10"
        
        //when
        let result: [String] = input.split(with: "×")
        
        //then
        let answer: [String] = ["12", "×", "5", "×", "10"]
        XCTAssertEqual(answer, result)
    }
    
    func testString_주어진_String_Type_42나누기2나누기21을_오버로딩한_split메소드를_사용해_나누기를_기준으로_나눈_경우_그_결과는_42_나누기_2_나누기_21이_담긴_StringArray와_같다() {
        //given
        let input: String = "42÷2÷21"
        
        //when
        let result: [String] = input.split(with: "÷")
        
        //then
        let answer: [String] = ["42", "÷", "2", "÷", "21"]
        XCTAssertEqual(answer, result)
    }
    
    func testString_주어진_String_Type_StringTypeSplitMethodTest를_오버로딩한_split메소드를_사용해_공백을_기준으로_나눈_경우_그_결과는_주어진_값_StringTypeSplitMethodTest이_담긴_StringArray와_같다() {
        //given
        let input: String = "StringTypeSplitMethodTest"
        
        //when
        let result: [String] = input.split(with: " ")
        
        //then
        let answer: [String] = ["StringTypeSplitMethodTest"]
        XCTAssertEqual(answer, result)
    }
    
    func testString_주어진_빈문자열을_오버로딩한_split메소드를_사용해_공백을_기준으로_나눈_경우_그_결과는_빈_StringArray와_같다() {
        //given
        let input: String = ""
        
        //when
        let result: [String] = input.split(with: " ")
        
        //then
        let answer: [String] = []
        XCTAssertEqual(answer, result)
    }
}
