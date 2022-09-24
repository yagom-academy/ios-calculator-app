//
//  FormulaTests.swift
//  FormulaTests
//
//  Created by Ayaan on 2022/09/23.
//

import XCTest

class FormulaTests: XCTestCase {
    func testFormula_Fornula_Type을_인스턴스화한_경우_그_값은_Nil이_아닙니다() {
        //given, when
        let formula: Formula = Formula()
        
        //then
        XCTAssertNotNil(formula)
    }
}
