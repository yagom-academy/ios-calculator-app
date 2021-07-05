//
//  CalculatorHelperTests.swift
//  CalculatorTests
//
//  Created by Kim Do hyung on 2021/07/01.
//

import XCTest
import Foundation
@testable import Calculator

class CalculatorManagerTests: XCTestCase {
    
    func test_10000을_준비하여_applyCommaOnThreeDigits메서드를_호출했을때_10콤마000이_나오는가() {
        //givin
        let expectInputValue = "10000"
        
        //when
        let result = CalculatorManager.applyCommaOnThreeDigits(notation: expectInputValue)
        let expectedResult = "10,000"
        
        //then
        XCTAssertEqual(expectedResult, result)
    }
    
    func test_초깃값을_준비하여_checkZeroButtonIsPressedInInitalValue메서드를_buttontext의값을_0으로_호출했을때_true가나오는가() {
            //given
            let expectInputValue = ""
            let expectButtonText = "0"
            
            //when
            let result = CalculatorManager.checkZeroButtonIsPressedInInitalValue(notation: expectInputValue, buttonText: expectButtonText)
            let expectedResult = true
            
            XCTAssertEqual(result,expectedResult)
        }
        
        func test_초깃값을_준비하여_checkZeroButtonIsPressedInInitalValue메서드를_buttontext의값을_1으로_호출했을때_false가나오는가() {
            //given
            let expectInputValue = ""
            let expectButtonText = "1"
            
            //when
            let result = CalculatorManager.checkZeroButtonIsPressedInInitalValue(notation: expectInputValue, buttonText: expectButtonText)
            let expectedResult = false
            
            XCTAssertEqual(result,expectedResult)
        }
        
        func test_일점삼공공공공_준비하여_removeZerosAfterDecimal메서드를_호출했을때_일점삼이_나오는가() {
            //given
            let expectInputValue = "1.30000"
            
            //when
            let result = CalculatorManager.removeZerosAfterDecimal(notation: expectInputValue)
            let expectedResult = "1.3"
            
            XCTAssertEqual(result, expectedResult)
        }
        
        func test_일점삼과_마이너스가눌렸을때를_준비하여_applyNotationSign메서드를_호출했을때_마이너스1점3이_나오는가() {
            //given
            let expectInputValue = "1.3"
            
            //when
            let result = CalculatorManager.applyNotationSign(notation: expectInputValue, isMinus: true)
            let expectedResult = "-1.3"
            
            XCTAssertEqual(result,expectedResult)
        }
        
        func test_초기값에서_점_이눌린것을_준비하여_pasteZeroInFrontOfDot메서드를_호출했을때_0점이_나오는가() {
            //given
            let expectInputValue = "."
            
            //when
            let result = CalculatorManager.pasteZeroInFrontOfDot(notation: expectInputValue)
            let expectedResult = "0."
            
            XCTAssertEqual(result,expectedResult)
        }
        
        func test_1점3을_준비하여_hasAlreadyDot메서드를_호출했을때_true가_나오는가() {
            //given
            let expectInputValue = "1.3"
            
            //when
            let result = CalculatorManager.hasAlreadyDot(notation: expectInputValue)
            let expectedResult = true
            
            XCTAssertEqual(result,expectedResult)
        }
        
        func test_1점3과더하기와_현재입력되고있는1을_준비하여_isVaildInfix메서드를_호출했을때_1점삼_더하기_1이_나오는가() {
            //given
            let expectInputValue = "1"
            let expectNotations = ["1.3", "+"]
            
            //when
            let result = CalculatorManager.getFinalInfixResult(validNotation: expectInputValue, notations: expectNotations)
            let expectedResult = ["1.3", "+", "1"]
            
            XCTAssertEqual(result,expectedResult)
        }
        
        func test_1점3과더하기와_현재입력되고있는값이_초기값일때를_준비하여_isVaildInfix메서드를_호출했을때_1점삼_더하기_0이_나오는가() {
            //given
            let expectInputValue = ""
            let expectNotations = ["1.3", "+"]
            
            //when
            let result = CalculatorManager.getFinalInfixResult(validNotation: expectInputValue, notations: expectNotations)
            let expectedResult = ["1.3", "+", "0"]
            
            XCTAssertEqual(result,expectedResult)
        }
}

