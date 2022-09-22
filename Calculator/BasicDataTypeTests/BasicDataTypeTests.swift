//
//  BasicDataTypeTests.swift
//  BasicDataTypeTests
//
//  Created by Ayaan on 2022/09/22.
//

import XCTest

class BasicDataTypeTests: XCTestCase {
    func test_Double_Type_실수_2를_is로_CalculateItem과_type_checking한_결과는_참인가() {
        let input: Double = 2.0
        
        let result: Bool = input is CalculateItem
        
        XCTAssertTrue(result)
    }
    
    func test_String_Type_AaBaCaDaEaF를_Character_Type_a를_파라메터로_split메소드를_호출하면_결과값이_A_B_C_D_E_F가_순서대로_담긴_String_Array_Type_인가() {
        let input: String = "AaBaCaDaEaF"
        
        let result: [String] = input.split(with: "a")
        
        let answer: [String] = ["A", "B", "C", "D", "E", "F"]
        XCTAssertEqual(answer, result)
    }
}
