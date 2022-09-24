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
    
    func testFormula_주어진_Double_Array를_operands에_순서대로_enqeueu한_경우_operands의_head의_data는_주어진_Double_Array의_첫번째값과_같습니다() {
            //given
            let input: [Double] = [1.0, 2.0, 3.0, 4.0, 5.0]
            let formula: Formula = Formula()
            
            //when
            input.forEach {
                formula.operands.enqueue($0)
            }
            
            //then
            XCTAssertEqual(input.first, formula.operands.head?.data)
        }
}
