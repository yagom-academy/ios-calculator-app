//
//  CalculatorTests.swift
//  CalculatorTests
//
//  Created by 이원빈 on 2022/05/16.
//

import XCTest
@testable import Calculator

class CalculatorTests: XCTestCase {
    var sut: CalculatorItemQueue<String>!
    var sut2: Fomula!

    override func setUpWithError() throws {
        try super.setUpWithError()
        sut = CalculatorItemQueue(stack: [])
        sut2 = Fomula(operands: CalculatorItemQueue<Double>(stack: []),
                      operators: CalculatorItemQueue<Character>(stack: []))
    }

    override func tearDownWithError() throws {
        try super.tearDownWithError()
        sut = nil
        sut2 = nil
    }

//MARK: - CalculatorItemQueue Test
    
    func test_enqueue를이용해_배열에1을추가했을때_1이들어갔는지() {
        //given
        let expectation = ["1"]
        //when
        sut.enqueue("1")
        //then
        XCTAssertEqual(expectation, sut.currentStack)
    }
    
    func test_enqueue를이용해_배열에1_2_3을추가했을때_1_2_3이_순서대로_들어가는지() {
        //given
        let expectation = ["1","2","3"]
        //when
        sut.enqueue("1")
        sut.enqueue("2")
        sut.enqueue("3")
        //then
        XCTAssertEqual(expectation, sut.currentStack)
    }
    
    func test_빈배열일때_isEmpty계산프로퍼티가_true인지() {
        //given
        
        //when
        let result = sut.isEmpty
        //then
        XCTAssertTrue(result)
    }
    
    func test_둘중_하나라도_빈배열이_아닐때_isEmpty계산프로퍼티가_false인지() {
        //given
        sut.enqueue("1")
        sut.enqueue("2")
        sut.enqueue("3")
        //when
        let result = sut.isEmpty
        //then
        XCTAssertFalse(result)
    }
    
    func test_1_2_3배열에서_dequeue를이용했을때_첫번째값인_1을얻을수있는지() {
        //given
        sut.enqueue("1")
        sut.enqueue("2")
        sut.enqueue("3")
        let expectation = "1"
        //when
        let result = sut.dequeue()
        //then
        XCTAssertEqual(expectation, result)
    }
    
    func test_빈배열에서_dequeue를이용했을때_nil을출력하는지() {
        //given
        
        //when
        let result = sut.dequeue()
        //then
        XCTAssertNil(result)
        
    }
    
    func test_1_2_3배열에서_dequeue를수행하면_기존배열이_2_3_으로변하는지() {
        //given
        sut.enqueue("1")
        sut.enqueue("2")
        sut.enqueue("3")
        let expectation = ["2","3"]
        //when
        sut.dequeue()
        //then
        XCTAssertEqual(expectation, sut.currentStack)
    }
    
    func test_1_2_3배열에서_peek계산프로퍼티에_1이반환되는지() {
        //given
        sut.enqueue("1")
        sut.enqueue("2")
        sut.enqueue("3")
        let expectation = "1"
        //when
        let result = sut.peek
        //then
        XCTAssertEqual(expectation, result)
    }
    
    func test_빈배열에서_peek계산프로퍼티에_nil이반환되는지() {
        //given
        
        //when
        let result = sut.peek
        //then
        XCTAssertNil(result)
    }
    
//MARK: - Fomula Test
    
    func test_operands와operator가_빈배열일때_result가_nil을출력하는지() {
        //given
        //when
        let result = sut2.result()
        //then
        XCTAssertNil(result)
    }
    
    func test_operands에_2가들어가고_operator는_비었을때_result가_nil을출력하는지() {
        //given
        sut2.operands.enqueue(2)
        //when
        let result = sut2.result()
        //then
        XCTAssertNil(result)
    }
    
    func test_operands에_2가들어가고_operator에_더하기가들어갔을때_result가_nil을출력하는지() {
        //given
        sut2.operands.enqueue(2)
        sut2.operators.enqueue("+")
        //when
        let result = sut2.result()
        //then
        XCTAssertNil(result)
    }
    
    func test_operands에_1_2가들어가고_operator에더하기가들어갔을때_result가_3을출력하는지() {
        //given
        sut2.operands.enqueue(1)
        sut2.operands.enqueue(2)
        sut2.operators.enqueue("+")
        let expectation = Double(3)
        //when
        let result = sut2.result()
        //then
        XCTAssertEqual(expectation, result)
    }
    
    func test_operands에_1_2_3가들어가고_operator에_더하기_빼기_가들어갔을때_result가_0_을출력하는지() {
        //given
        sut2.operands.enqueue(1)
        sut2.operands.enqueue(2)
        sut2.operands.enqueue(3)
        
        sut2.operators.enqueue("+")
        sut2.operators.enqueue("-")
        
        let expectation = Double(0)
        //when
        let result = sut2.result()
        //then
        XCTAssertEqual(expectation, result)
    }
    
    func test_operands에_1_2_3_9_27_2가들어가고_operator에_더하기_빼기_더하기_더하기_나누기가들어갔을때_result가_18_을출력하는지() {
        //given
        sut2.operands.enqueue(1)
        sut2.operands.enqueue(2)
        sut2.operands.enqueue(3)
        sut2.operands.enqueue(9)
        sut2.operands.enqueue(27)
        sut2.operands.enqueue(2)
        
        sut2.operators.enqueue("+")
        sut2.operators.enqueue("-")
        sut2.operators.enqueue("+")
        sut2.operators.enqueue("+")
        sut2.operators.enqueue("÷")
        
        let expectation = Double(18)
        //when
        let result = sut2.result()
        //then
        XCTAssertEqual(expectation, result)
    }
    
//MARK: - ExpressionParser Test
    
    func test_빈문자열이주어졌을때_Fomula의result로_nil출력되는지() {
        //given
        let str = ""
        //when
        var fomula = ExpressionParser.parse(from: str)
        let result = fomula.result()
        //then
        XCTAssertNil(result)
    }
    
    func test_문자열_3_주어졌을때_Fomula의result로_nil출력되는지() {
        //given
        let str = "3"
        //when
        var fomula = ExpressionParser.parse(from: str)
        let result = fomula.result()
        //then
        XCTAssertNil(result)
    }
    
    func test_문자열_3더하기_주어졌을때_Fomula의result로_nil출력되는지() {
        //given
        let str = "3+"
        //when
        var fomula = ExpressionParser.parse(from: str)
        let result = fomula.result()
        //then
        XCTAssertNil(result)
    }
    
    func test_문자열_3더하기9곱하기2_가주어졌을때_Fomula의operands에3_9_2가들어가고_opeartors에더하기_곱하기가들어가는지() {
        //given
        let str = "3+9×2"
        let operandsExpectation: [Double] = [3,9,2]
        let operatorsExpectation: [Character] = ["+", "×"]
        //when
        let fomula = ExpressionParser.parse(from: str)
        //then
        XCTAssertEqual(operandsExpectation, fomula.operands.currentStack)
        XCTAssertEqual(operatorsExpectation, fomula.operators.currentStack)
    }
    
    func test_문자열_3더하기9곱하기2_가주어졌을때_Fomula의result로_24가출력되는지() {
        //given
        let str = "3+9×2"
        let expectation = Double(24)
        //when
        var fomula = ExpressionParser.parse(from: str)
        let result = fomula.result()
        //then
        XCTAssertEqual(expectation, result)
    }
}
