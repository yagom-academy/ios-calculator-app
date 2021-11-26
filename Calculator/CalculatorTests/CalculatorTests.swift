//
//  CalculatorTests.swift
//  CalculatorTests
//
//  Created by JeongTaek Han on 2021/11/23.
//

import XCTest

class CalculatorTests: XCTestCase {
    
    var sutCalculator: Calculator!

    override func setUpWithError() throws {
        sutCalculator = Calculator()
    }

    override func tearDownWithError() throws {
        sutCalculator = nil
    }

    func test_2_더하기_3_빼기_4_더하기_5_버튼을_클릭한_후_연산_버튼을_클릭하면_문자열_6을_반환해야한다() {
        // given
        sutCalculator.touchNumberButton(Buttons.two)
        sutCalculator.touchOperatorButton(Buttons.add)
        sutCalculator.touchNumberButton(Buttons.three)
        sutCalculator.touchOperatorButton(Buttons.subtract)
        sutCalculator.touchNumberButton(Buttons.four)
        sutCalculator.touchOperatorButton(Buttons.add)
        sutCalculator.touchNumberButton(Buttons.five)
        sutCalculator.touchEvaluateButton()
        
        // when
        let result = sutCalculator.currentInputOperand
        
        // then
        XCTAssertEqual(result, "6")
    }
    
    func test_2_더하기_3_곱하기_3_빼기_1_버튼을_클릭한_후_연산_버튼을_클릭하면_문자열_14를_반환해야한다() {
        // given
        sutCalculator.touchNumberButton(Buttons.two)
        sutCalculator.touchOperatorButton(Buttons.add)
        sutCalculator.touchNumberButton(Buttons.three)
        sutCalculator.touchOperatorButton(Buttons.multiply)
        sutCalculator.touchNumberButton(Buttons.three)
        sutCalculator.touchOperatorButton(Buttons.subtract)
        sutCalculator.touchNumberButton(Buttons.one)
        sutCalculator.touchEvaluateButton()
        
        // when
        let result = sutCalculator.currentInputOperand
        
        // then
        XCTAssertEqual(result, "14")
    }
    
    func test_3_나누기_3_더하기_2_빼기_1_버튼을_클릭한_후_연산_버튼을_클릭하면_2를_반환해야한다() {
        // given
        sutCalculator.touchNumberButton(Buttons.three)
        sutCalculator.touchOperatorButton(Buttons.divide)
        sutCalculator.touchNumberButton(Buttons.three)
        sutCalculator.touchOperatorButton(Buttons.add)
        sutCalculator.touchNumberButton(Buttons.two)
        sutCalculator.touchOperatorButton(Buttons.subtract)
        sutCalculator.touchNumberButton(Buttons.one)
        sutCalculator.touchEvaluateButton()

        // when
        let result = sutCalculator.currentInputOperand

        // then
        XCTAssertEqual(result, "2")
    }

    func test_1_더하기_2_빼기_3_곱하기_2_빼기_3_나누기_6_버튼을_클릭한_후_연산_버튼을_클릭하면_음수0점5를_반환해야한다() {
        // given
        sutCalculator.touchNumberButton(Buttons.one)
        sutCalculator.touchOperatorButton(Buttons.add)
        sutCalculator.touchNumberButton(Buttons.two)
        sutCalculator.touchOperatorButton(Buttons.subtract)
        sutCalculator.touchNumberButton(Buttons.three)
        sutCalculator.touchOperatorButton(Buttons.multiply)
        sutCalculator.touchNumberButton(Buttons.two)
        sutCalculator.touchOperatorButton(Buttons.subtract)
        sutCalculator.touchNumberButton(Buttons.three)
        sutCalculator.touchOperatorButton(Buttons.divide)
        sutCalculator.touchNumberButton(Buttons.six)
        sutCalculator.touchEvaluateButton()

        // when
        let result = sutCalculator.currentInputOperand

        // then
        XCTAssertEqual(result, "-0.5")
    }

    func test_1_더하기_2_빼기_3_곱하기_2_빼기_음수3_나누기_6_버튼을_클릭한_후_연산_버튼을_클릭하면_1점5를_반환해야한다() {
        // given
        sutCalculator.touchNumberButton(Buttons.one)
        sutCalculator.touchOperatorButton(Buttons.add)
        sutCalculator.touchNumberButton(Buttons.two)
        sutCalculator.touchOperatorButton(Buttons.subtract)
        sutCalculator.touchNumberButton(Buttons.three)
        sutCalculator.touchSignChangeButton()
        sutCalculator.touchOperatorButton(Buttons.multiply)
        sutCalculator.touchNumberButton(Buttons.two)
        sutCalculator.touchOperatorButton(Buttons.subtract)
        sutCalculator.touchNumberButton(Buttons.three)
        sutCalculator.touchOperatorButton(Buttons.divide)
        sutCalculator.touchNumberButton(Buttons.six)
        sutCalculator.touchEvaluateButton()

        // when
        let result = sutCalculator.currentInputOperand

        // then
        XCTAssertEqual(result, "1.5")
    }

    func test_1점3_더하기_음수2점3_빼기_3점8_곱하기_2_의_버튼을_클릭한_후_연산_버튼을_클릭하면_음수9점6을_반환해야한다() {
        // given
        sutCalculator.touchNumberButton(Buttons.one)
        sutCalculator.touchPointButton()
        sutCalculator.touchNumberButton(Buttons.three)
        sutCalculator.touchOperatorButton(Buttons.add)
        sutCalculator.touchNumberButton(Buttons.two)
        sutCalculator.touchPointButton()
        sutCalculator.touchNumberButton(Buttons.three)
        sutCalculator.touchSignChangeButton()
        sutCalculator.touchOperatorButton(Buttons.subtract)
        sutCalculator.touchNumberButton(Buttons.three)
        sutCalculator.touchPointButton()
        sutCalculator.touchNumberButton(Buttons.eight)
        sutCalculator.touchOperatorButton(Buttons.multiply)
        sutCalculator.touchNumberButton(Buttons.two)
        sutCalculator.touchEvaluateButton()

        // when
        let result = sutCalculator.currentInputOperand

        // then
        XCTAssertEqual(result, "-9.6")
    }

    func test_1점3_더하기_음수2점3_버튼을_클릭한_후_연산_버튼을_클릭하면_음수1을_반환해야한다() {
        // given
        sutCalculator.touchNumberButton(Buttons.one)
        sutCalculator.touchPointButton()
        sutCalculator.touchNumberButton(Buttons.three)
        sutCalculator.touchOperatorButton(Buttons.add)
        sutCalculator.touchNumberButton(Buttons.two)
        sutCalculator.touchPointButton()
        sutCalculator.touchNumberButton(Buttons.three)
        sutCalculator.touchSignChangeButton()
        sutCalculator.touchEvaluateButton()

        // when
        let result = sutCalculator.currentInputOperand

        // then
        XCTAssertEqual(result, "-1")
    }

    func test_1_더하기_1_입력_후_연산_버튼을_클릭한_후에_더하기_1_클릭후_연산_버튼을_클릭하면_3을_반환해야한다() {
        // given
        sutCalculator.touchNumberButton(Buttons.one)
        sutCalculator.touchOperatorButton(Buttons.add)
        sutCalculator.touchNumberButton(Buttons.one)
        sutCalculator.touchEvaluateButton()
        sutCalculator.touchOperatorButton(Buttons.add)
        sutCalculator.touchNumberButton(Buttons.one)
        sutCalculator.touchEvaluateButton()

        // when
        let result = sutCalculator.currentInputOperand

        // then
        XCTAssertEqual(result, "3")
    }

    func test_1_잘못된_연산자_곱하기_2_클릭후_연산_버튼을_클릭하면_error를_반환해야한다() {
        // given
        sutCalculator.touchNumberButton(Buttons.one)
        sutCalculator.touchOperatorButton("*")
        sutCalculator.touchNumberButton(Buttons.two)
        sutCalculator.touchEvaluateButton()

        // when
        let result = sutCalculator.currentInputOperand

        // then
        XCTAssertEqual(result, "error")
    }
    
    func test_10_나누기_0_클릭후_연산_버튼을_클릭하면_NaN을_반환해야한다() {
        // given
        sutCalculator.touchNumberButton(Buttons.one)
        sutCalculator.touchNumberButton(Buttons.zero)
        sutCalculator.touchOperatorButton(Buttons.divide)
        sutCalculator.touchNumberButton(Buttons.zero)
        sutCalculator.touchEvaluateButton()

        // when
        let result = sutCalculator.currentInputOperand

        // then
        XCTAssertEqual(result, "NaN")
    }
    
    func test_10_나누기_0_클릭후_연산_버튼을_클릭한뒤_AC를_클릭하면_0을_반환하고_수식보관배열이_비어있어야한다() {
        // given
        sutCalculator.touchNumberButton(Buttons.one)
        sutCalculator.touchNumberButton(Buttons.zero)
        sutCalculator.touchOperatorButton(Buttons.divide)
        sutCalculator.touchNumberButton(Buttons.zero)
        sutCalculator.touchEvaluateButton()
        sutCalculator.touchAllClearButton()

        // when
        let result = sutCalculator.currentInputOperand

        // then
        XCTAssertEqual(result, "0")
        XCTAssertTrue(sutCalculator.mathExpression.isEmpty)
    }
    
    func test_10_나누기_2_클릭후_CE_버튼을_클릭하면_현재_상태로_0과_나눗셈이_남아있어야한다() {
        // given
        sutCalculator.touchNumberButton(Buttons.one)
        sutCalculator.touchNumberButton(Buttons.zero)
        sutCalculator.touchOperatorButton(Buttons.divide)
        sutCalculator.touchNumberButton(Buttons.two)
        sutCalculator.touchClearEntryButton()

        // when
        let result = sutCalculator.currentInputOperand

        // then
        XCTAssertEqual(result, "0")
        XCTAssertEqual(sutCalculator.currentInputOperator, Buttons.divide)
    }
    
    func test_0버튼을_중복해서_5번_클릭하면_0을_반환해야한다() {
        // given
        sutCalculator.touchNumberButton(Buttons.zero)
        sutCalculator.touchNumberButton(Buttons.zero)
        sutCalculator.touchNumberButton(Buttons.zero)
        sutCalculator.touchNumberButton(Buttons.zero)
        sutCalculator.touchNumberButton(Buttons.zero)

        // when
        let result = sutCalculator.currentInputOperand

        // then
        XCTAssertEqual(result, "0")
    }
    
    func test_00버튼을_중복해서_5번_클릭하면_0을_반환해야한다() {
        // given
        sutCalculator.touchNumberButton(Buttons.doubleZero)
        sutCalculator.touchNumberButton(Buttons.doubleZero)
        sutCalculator.touchNumberButton(Buttons.doubleZero)
        sutCalculator.touchNumberButton(Buttons.doubleZero)
        sutCalculator.touchNumberButton(Buttons.doubleZero)

        // when
        let result = sutCalculator.currentInputOperand

        // then
        XCTAssertEqual(result, "0")
    }
    
    func test_point버튼을_중복해서_5번_클릭_후_5버튼_입력시_0점5를_반환해야한다() {
        // given
        sutCalculator.touchPointButton()
        sutCalculator.touchPointButton()
        sutCalculator.touchPointButton()
        sutCalculator.touchPointButton()
        sutCalculator.touchPointButton()
        sutCalculator.touchNumberButton(Buttons.five)

        // when
        let result = sutCalculator.currentInputOperand

        // then
        XCTAssertEqual(result, "0.5")
    }
    
}
