//
//  FormulaTests.swift
//  FormulaTests
//
//  Created by Ayaan on 2022/09/23.
//

import XCTest

class FormulaTests: XCTestCase {
    var sut: Formula!
    
    override func setUpWithError() throws {
        try super.setUpWithError()
        sut = Formula()
    }
    
    override func tearDownWithError() throws {
        try super.tearDownWithError()
        sut = nil
    }
    
    func testFormula_주어진_Double_Array인_실수_1_2_3_4_5를_operands에_순서대로_enqeueu한_경우_operands의_head의_data는_주어진_Double_Array의_첫번째값과_같다() {
        //given
        let input: [Double] = [1.0, 2.0, 3.0, 4.0, 5.0]
        
        //when
        input.forEach {
            sut.operands.enqueue($0)
        }
        
        //then
        XCTAssertEqual(input.first, sut.operands.head?.data)
    }
    
    func testFormula_주어진_Operator_Array인_add_add_divide_multiply_subtract를_operator에_순서대로_endqueue한_경우_operator의_head의_data는_주어진_Operator_Array의_첫번째값과_같다() {
        //given
        let input: [Operator] = [.add, .add, .divide, .multiply, .subtract]
        
        //when
        input.forEach {
            sut.operators.enqueue($0)
        }
        
        //then
        XCTAssertEqual(input.first, sut.operators.head?.data)
    }
    
    func testFormula_주어진_두개의_실수_2와_1그리고_Operator_add_Case를_operands와_operators에_enqueue한_후_result_메소드를_호출한_경우_그_결과는_실수3과_같다() {
        //given
        let inputOperands: [Double] = [2.0, 1.0]
        let inputOperators: Operator = Operator.add
        
        //when
        inputOperands.forEach {
            sut.operands.enqueue($0)
        }
        
        sut.operators.enqueue(inputOperators)
        
        guard let result: Double = try? sut.result() else {
            return
        }
        
        //then
        XCTAssertEqual(3.0, result)
    }
    
    func testFormula_주어진_두개의_실수_2와_1그리고_Operator_subtract_Case를_operands와_operators에_enqueue한_후_result_메소드를_호출한_경우_그_결과는_실수1과_같다() {
        //given
        let inputOperands: [Double] = [2.0, 1.0]
        let inputOperators: Operator = Operator.subtract
        
        //when
        inputOperands.forEach {
            sut.operands.enqueue($0)
        }
        
        sut.operators.enqueue(inputOperators)
        
        guard let result: Double = try? sut.result() else {
            return
        }
        
        //then
        XCTAssertEqual(1.0, result)
    }
    
    func testFormula_주어진_두개의_실수_2와_1그리고_Operator_divide_Case를_operands와_operators에_enqueue한_후_result_메소드를_호출한_경우_그_결과는_실수1과_같다() {
        //given
        let inputOperands: [Double] = [2.0, 1.0]
        let inputOperators: Operator = Operator.divide
        
        //when
        inputOperands.forEach {
            sut.operands.enqueue($0)
        }
        
        sut.operators.enqueue(inputOperators)
        
        guard let result: Double = try? sut.result() else {
            return
        }
        
        //then
        XCTAssertEqual(2.0, result)
    }
    
    func testFormula_주어진_두개의_실수_2와_1그리고_Operator_multiply_Case를_operands와_operators에_enqueue한_후_result_메소드를_호출한_경우_그_결과는_실수3과_같다() {
        //given
        let inputOperands: [Double] = [2.0, 1.0]
        let inputOperators: Operator = Operator.multiply
        
        //when
        inputOperands.forEach {
            sut.operands.enqueue($0)
        }
        
        sut.operators.enqueue(inputOperators)
        
        guard let result: Double = try? sut.result() else {
            return
        }
        
        //then
        XCTAssertEqual(2.0, result)
    }
    
    func testFormula_주어진_5개의_실수_1_2_5_2_40와_4개의_Operator_add_subtract_divide_multiply를_operands와_operators에_순서대로_enqueue한_후_result_메소드를_호출한_경우_그_결과는_실수40이다() {
        //given
        let inputOperands: [Double] = [1.0, 2.0, 5.0, 2.0, 40]
        let inputOperators: [Operator] = [.add, .subtract, .divide, .multiply]
        
        //when
        inputOperands.forEach {
            sut.operands.enqueue($0)
        }
        
        inputOperators.forEach {
            sut.operators.enqueue($0)
        }
        
        guard let result: Double = try? sut.result() else {
            return
        }
        
        //then
        XCTAssertEqual(-40.0, result)
    }
    
    func testFormula_result_메소드는_피연산자와_연산자가_아무것도_없는_경우_오류를_던진다() {
        //given
        sut = Formula()
        
        //when,then
        XCTAssertThrowsError(try sut.result())
    }
    
    func testFormula_result_메소드는_주어진_피연산자와_연산자간의_갯수가_동일한_경우_오류를_던진다() {
        //given
        let inputOperands: [Double] = [1.0, 2.0, 5.0, 2.0]
        let inputOperators: [Operator] = [.add, .subtract, .divide, .multiply]
        
        inputOperands.forEach {
            sut.operands.enqueue($0)
        }
        
        inputOperators.forEach {
            sut.operators.enqueue($0)
        }
        
        //when,then
        XCTAssertThrowsError(try sut.result())
    }
    
    func testFormula_result_메소드는_주어진_피연산자보다_연산자의_갯수가_많은_경우_오류를_던진다() {
        //given
        let inputOperands: [Double] = [1.0, 2.0, 5.0, 2.0]
        let inputOperators: [Operator] = [.add, .subtract, .divide, .multiply, .add]
        
        inputOperands.forEach {
            sut.operands.enqueue($0)
        }
        
        inputOperators.forEach {
            sut.operators.enqueue($0)
        }
        
        //when,then
        XCTAssertThrowsError(try sut.result())
    }
    
    func testFormula_result_메소드는_주어진_피연산자의_갯수가_연산자보다_2개이상_많은_경우_오류를_던진다() {
        //given
        let inputOperands: [Double] = [1.0, 2.0, 5.0, 2.0, 6.0, 20.0]
        let inputOperators: [Operator] = [.add, .subtract, .divide, .multiply]
        
        inputOperands.forEach {
            sut.operands.enqueue($0)
        }
        
        inputOperators.forEach {
            sut.operators.enqueue($0)
        }
        
        //when,then
        XCTAssertThrowsError(try sut.result())
    }
    
    func testFormula_result_메소드는_나누기를_실수0으로_계산하려고_하는_경우_오류를_던진다() {
        //given
        let inputOperands: [Double] = [1.0, 2.0, 0.0, 6.5]
        let inputOperators: [Operator] = [.add, .divide, .subtract]
        
        inputOperands.forEach {
            sut.operands.enqueue($0)
        }
        
        inputOperators.forEach {
            sut.operators.enqueue($0)
        }
        
        //when,then
        XCTAssertThrowsError(try sut.result())
    }
}
