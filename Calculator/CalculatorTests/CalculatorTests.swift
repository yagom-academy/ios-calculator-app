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

    override func setUpWithError() throws {
        try super.setUpWithError()
        sut = CalculatorItemQueue<String>()
    }

    override func tearDownWithError() throws {
        try super.tearDownWithError()
        sut = nil
    }
    
    func test_enqueue를이용해_배열에1을추가했을때_1이들어갔는지() {
        //given
        let expectation = ["1"]
        //when
        sut.enqueue("1")
        //then
        XCTAssertEqual(expectation, sut.enQueueStack)
    }
    
    func test_enqueue를이용해_배열에1_2_3을추가했을때_1_2_3이_순서대로_들어가는지() {
        //given
        let expectation = ["1","2","3"]
        //when
        sut.enQueue("1")
        sut.enQueue("2")
        sut.enQueue("3")
        //then
        XCTAssertEqual(expectation, sut.enQueueStack)
    }
    
    func test_빈배열일때_isEmpty계산프로퍼티가_true인지() {
        //given
        sut.enQueueStack = []
        sut.deQueueStack = []
        //when
        let result = sut.isEmpty
        //then
        XCTAssertTrue(result)
    }
    
    func test_둘중_하나라도_빈배열이_아닐때_isEmpty계산프로퍼티가_false인지() {
        //given
        sut.enQueueStack = ["1","2","3"]
        sut.deQueueStack = []
        //when
        let result = sut.isEmpty
        //then
        XCTAssertFalse(result)
    }
    
    func test_1_2_3배열에서_dequeue를이용했을때_첫번째값인_1을얻을수있는지() {
        //given
        sut.enQueueStack = ["1", "2", "3"]
        let expectation = "1"
        //when
        let result = sut.deQueue()
        //then
        XCTAssertEqual(expectation, result)
    }
    
    func test_빈배열에서_dequeue를이용했을때_nil을출력하는지() {
        //given
        sut.enQueueStack = []
        //when
        let result = sut.deQueue()
        //then
        XCTAssertNil(result)
        
    }
    
    func test_1_2_3배열에서_dequeue를수행하면_기존배열이_2_3_으로변하는지() {
        //given
        sut.enQueueStack = ["1", "2", "3"]
        let expectation = ["2","3"]
        //when
        sut.deQueue()
        //then
        XCTAssertEqual(expectation, sut.currentArray)
    }
    
    func test_1_2_3배열에서_peek계산프로퍼티에_1이반환되는지() {
        //given
        sut.enQueueStack = ["1", "2", "3"]
        let expectation = "1"
        //when
        let result = sut.peek
        //then
        XCTAssertEqual(expectation, result)
    }
    
    func test_빈배열에서_peek계산프로퍼티에_nil이반환되는지() {
        //given
        sut.enQueueStack = []
        sut.deQueueStack = []
        //when
        let result = sut.peek
        //then
        XCTAssertNil(result)
    }
    
}
