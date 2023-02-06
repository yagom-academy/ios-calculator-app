//
//  ExpressionParserTests.swift
//  ExpressionParserTests
//
//  Created by kimseongjun on 2023/01/29.
//

import XCTest
@testable import Calculator

final class ExpressionParserTests: XCTestCase {
   
    override func setUpWithError() throws {
        try super.setUpWithError()
    }

    override func tearDownWithError() throws {
        try super.tearDownWithError()
    }

    func test_parse메서드에_1더하기12빼기8곱하기2를_넣었을때_1과12와8과2의배열과더하기와빼기와곱하기의배열이_나온다() {
        
        //given
        let input = "1+12−8×2"
        let expectedValueOfOperators: [Operator] = [.add, .subtract, .multiply]
        let expectedValueOfOerands: [Double] = [1, 12, 8, 2]
        
        //when
        let formula = ExpressionParser.parse(from: input)
        let resultOfOperators = formula.operators.enqueueStack
        let resultOfOperands = formula.operands.enqueueStack
        
        
        //then
        XCTAssertEqual(resultOfOperators, expectedValueOfOperators)
        XCTAssertEqual(resultOfOperands, expectedValueOfOerands)
    }
    
    func test_parse메서드에_1더하기음수12를_넣었을때_operands에_1과음수12가담기고_operators에_더하기가_담긴다() {
        //given
        let input = "1+⎼12"
        let expectedValueOfOperators: [Operator] = [.add]
        let expectedValueOfOerands: [Double] = [1, -12]
        
        //when
        let formula = ExpressionParser.parse(from: input)
        let resultOfOperators = formula.operators.enqueueStack
        let resultOfOperands = formula.operands.enqueueStack
        
        //then
        XCTAssertEqual(resultOfOperators, expectedValueOfOperators)
        XCTAssertEqual(resultOfOperands, expectedValueOfOerands)
    }
    

}
