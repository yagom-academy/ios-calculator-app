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
        var formula: Formula = Formula()
        
        //when
        input.forEach {
            formula.operands.enqueue($0)
        }
        
        //then
        XCTAssertEqual(input.first, formula.operands.head?.data)
    }
    
    func testFormula_주어진_Operator_Array를_operator에_순서대로_endqueue한_경우_operator의_head의_data는_주어진_Operator_Array의_첫번째값과_같습니다() {
        //given
        let input: [Operator] = [.add, .add, .divide, .multiply, .subtract]
        var formula: Formula = Formula()
        
        //when
        input.forEach {
            formula.operators.enqueue($0)
        }
        
        //then
        XCTAssertEqual(input.first, formula.operators.head?.data)
    }
    
    func testFormula_주어진_두개의_실수_2와_1과_Operator의_add_Case를_operands와_operators에_전부_enqueue한_후_result_메소드를_호출한_경우_그_결과는_실수3입니다() {
        //given
        let inputOperands: [Double] = [2.0, 1.0]
        let inputOperators: Operator = Operator.add
        var formula: Formula = Formula()
        
        //when
        inputOperands.forEach {
            formula.operands.enqueue($0)
        }
        formula.operators.enqueue(inputOperators)
        let result: Double = formula.result()
        
        //then
        XCTAssertEqual(3.0, result)
    }
    
    func testFormula_주어진_두개의_실수_2와_1과_Operator의_subtract_Case를_operands와_operators에_전부_enqueue한_후_result_메소드를_호출한_경우_그_결과는_실수1입니다() {
        //given
        let inputOperands: [Double] = [2.0, 1.0]
        let inputOperators: Operator = Operator.subtract
        var formula: Formula = Formula()
        
        //when
        inputOperands.forEach {
            formula.operands.enqueue($0)
        }
        formula.operators.enqueue(inputOperators)
        let result: Double = formula.result()
        
        //then
        XCTAssertEqual(1.0, result)
    }
    
    func testFormula_주어진_두개의_실수_2와_1과_Operator의_divide_Case를_operands와_operators에_전부_enqueue한_후_result_메소드를_호출한_경우_그_결과는_실수1입니다() {
        //given
        let inputOperands: [Double] = [2.0, 1.0]
        let inputOperators: Operator = Operator.divide
        var formula: Formula = Formula()
        
        //when
        inputOperands.forEach {
            formula.operands.enqueue($0)
        }
        formula.operators.enqueue(inputOperators)
        let result: Double = formula.result()
        
        //then
        XCTAssertEqual(2.0, result)
    }
    
    func testFormula_주어진_두개의_실수_2와_1과_Operator의_multiply_Case를_operands와_operators에_전부_enqueue한_후_result_메소드를_호출한_경우_그_결과는_실수3입니다() {
        //given
        let inputOperands: [Double] = [2.0, 1.0]
        let inputOperators: Operator = Operator.multiply
        var formula: Formula = Formula()
        
        //when
        inputOperands.forEach {
            formula.operands.enqueue($0)
        }
        formula.operators.enqueue(inputOperators)
        let result: Double = formula.result()
        
        //then
        XCTAssertEqual(2.0, result)
    }
    
    func testFormula_주어진_5개의_실수_1_2_5_2_40와_4개의_Operator_add_subtract_divide_multiply를_operands와_operators에_전부_enqueue한_후_result_메소드를_호출한_경우_그_결과는_실수40입니다() {
        //given
        let inputOperands: [Double] = [1.0, 2.0, 5.0, 2.0, 40]
        let inputOperators: [Operator] = [.add, .subtract, .divide, .multiply]
        var formula: Formula = Formula()
        
        //when
        inputOperands.forEach {
            formula.operands.enqueue($0)
        }
        
        inputOperators.forEach {
            formula.operators.enqueue($0)
        }
        
        let result: Double = formula.result()
        
        //then
        XCTAssertEqual(40.0, result)
    }
}
