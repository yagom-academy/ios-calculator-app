//
//  FormulaTests.swift
//  FormulaTests
//
//  Created by Ayaan on 2022/09/23.
//

import XCTest

class FormulaTests: XCTestCase {
    func test_Formula_Type을_인스턴스화하면_그_값이_nil이_아닌가() {
        //given, when
        let formula: Formula = Formula()
        
        //then
        XCTAssertNotNil(formula)
    }
}
