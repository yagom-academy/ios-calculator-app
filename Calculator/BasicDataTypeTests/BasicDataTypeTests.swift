//
//  BasicDataTypeTests.swift
//  BasicDataTypeTests
//
//  Created by Ayaan on 2022/09/22.
//

import XCTest

class BasicDataTypeTests: XCTestCase {
    func testDouble_주어진_실수2를_CalculateItem_Type으로_Type_Checking한_경우_그_결과는_참입니다() {
        //given
        let input: Double = 2.0
        
        //when
        let result: Bool = input is CalculateItem
        
        //then
        XCTAssertTrue(result)
    }
    
    func testString_주어진_AaBaCaDaEaF를_split메소드를_사용해_a를_기준으로_나눈_경우_그_결과는_A_a_B_a_C_a_D_a_E_a_F가_담긴_StringArray입니다() {
        //given
        let input: String = "AaBaCaDaEaF"
        
        //when
        let result: [String] = input.split(with: "a")
        
        //then
        let answer: [String] = ["A", "a", "B", "a", "C", "a", "D", "a", "E", "a", "F"]
        XCTAssertEqual(answer, result)
    }
}
