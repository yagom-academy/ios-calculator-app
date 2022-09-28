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
        
        let result: Double = sut.result()
        
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
        
        let result: Double = sut.result()
        
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
        
        let result: Double = sut.result()
        
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
        
        let result: Double = sut.result()
        
        //then
        XCTAssertEqual(2.0, result)
    }
    
    func testFormula_주어진_5개의_실수_1_2_5_2_40과_4개의_Operator_add_subtract_divide_multiply를_operands와_operators에_순서대로_enqueue한_후_result_메소드를_호출한_경우_그_결과는_실수40이다() {
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
        
        let result: Double = sut.result()
        
        //then
        XCTAssertEqual(-40.0, result)
    }
    
    func testFormula_result_메소드는_피연산자와_연산자가_아무것도_없는_경우_그_결과는_zero이다() {
        //given
        sut = Formula()
        
        //when
        let result: Double = sut.result()
        
        //then
        XCTAssertEqual(Double.zero, result)
    }
    
    func testFormula_주어진_1개의_실수10_operands에_enqueue한_후_result_메소드를_호출하면_그_결과는_주어진_실수_10과_같다() {
        //given
        let inputOperands: Double = 10.0
        sut.operands.enqueue(inputOperands)

        //when
        let result: Double = sut.result()
        
        //then
        XCTAssertEqual(inputOperands, result)
    }
    
    func testFormula_주어진_피연산자_실수_10_20을_operands에_순서대로_enqueue한_후_result_메소드를_호출하면_결과는_zero이다() {
        //given
        let inputOperands: [Double] = [10.0, 20.0]
        
        inputOperands.forEach {
            sut.operands.enqueue($0)
        }
        
        //when
        let result: Double = sut.result()
        
        //then
        XCTAssertEqual(Double.zero, result)
    }
    
    func testFormula_주어진_연산자_Operator_add를_operators에_enqueue한_후_result_메소드를_호출하면_결과는_zero이다() {
        //given
        let inputOperators: Operator = .add

        sut.operators.enqueue(inputOperators)
        
        //when
        let result: Double = sut.result()
        
        //then
        XCTAssertEqual(Double.zero, result)
    }
    
    func testFormula_result_메소드는_주어진_피연산자와_연산자간의_갯수가_동일한_경우_그_결과는_zero이다() {
        //given
        let inputOperands: [Double] = [1.0, 2.0, 5.0, 2.0]
        let inputOperators: [Operator] = [.add, .subtract, .divide, .multiply]
        
        inputOperands.forEach {
            sut.operands.enqueue($0)
        }
        
        inputOperators.forEach {
            sut.operators.enqueue($0)
        }
        
        //when
        let result: Double = sut.result()
        
        //then
        XCTAssertEqual(Double.zero, result)
    }
    
    func testFormula_result_메소드는_주어진_피연산자보다_연산자의_갯수가_많은_경우_그_결과는_zero이다() {
        //given
        let inputOperands: [Double] = [1.0, 2.0, 5.0, 2.0]
        let inputOperators: [Operator] = [.add, .subtract, .divide, .multiply, .add]
        
        inputOperands.forEach {
            sut.operands.enqueue($0)
        }
        
        inputOperators.forEach {
            sut.operators.enqueue($0)
        }
        
        //when
        let result: Double = sut.result()
        
        //then
        XCTAssertEqual(Double.zero, result)
    }
    
    func testFormula_result_메소드는_주어진_피연산자의_갯수가_연산자보다_2개이상_많은_경우_그_결과는_zero이다() {
        //given
        let inputOperands: [Double] = [1.0, 2.0, 5.0, 2.0, 6.0, 20.0]
        let inputOperators: [Operator] = [.add, .subtract, .divide, .multiply]
        
        inputOperands.forEach {
            sut.operands.enqueue($0)
        }
        
        inputOperators.forEach {
            sut.operators.enqueue($0)
        }
        
        //when
        let result: Double = sut.result()
        
        //then
        XCTAssertEqual(Double.zero, result)
    }
    
    func testFormula_result_메소드는_나누기를_실수0으로_계산하려고_하는_경우_그_결과는_infinity이다() {
        //given
        let inputOperands: [Double] = [1.0, 2.0, 0.0, 6.5]
        let inputOperators: [Operator] = [.add, .divide, .subtract]

        inputOperands.forEach {
            sut.operands.enqueue($0)
        }
        
        inputOperators.forEach {
            sut.operators.enqueue($0)
        }
        
        //when
        let result: Double = sut.result()
        
        //then
        XCTAssertEqual(Double.infinity, result)
    }
}
