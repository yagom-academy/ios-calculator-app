//
//  CalculatorTests.swift
//  CalculatorTests
//
//  Created by 유한석 on 2022/05/16.
//

import XCTest

class CalculatorTests: XCTestCase {
    var sut: CalculatorItemQueue!
    override func setUpWithError() throws {
        try super.setUpWithError()
        sut = CalculatorItemQueue()
    }

    override func tearDownWithError() throws {
        try super.tearDownWithError()
        sut = nil
    }
    
// MARK: - CalculatorItemQueue.count
    func test_enqueue에1개_dequeue에2개_일때_큐의길이는3반환() {
        //given
        sut.enqueue = ["1"]
        sut.dequeue = ["2","3"]
        
        //when
        let result = sut.count
        
        //then
        XCTAssertEqual(result, 3)
    }
    
    func test_queue에요소가없으면_0반환() {
        //when
        let result = sut.count
        
        //then
        XCTAssertEqual(result, 0)
    }
    
// MARK: - CalculatorItemQueue.enQueue
    func test_queue에_값_한개_삽입() {
        //given
        let input = "3"
        
        //when
        sut.enQueue(input)
        let result = sut.enqueue
        
        //then
        XCTAssertEqual(result, ["3"])
    }
    
    func test_queue에_값_3개_삽입() {
        //given
        let input1 = "3"
        let input2 = "6"
        let input3 = "9"
        
        //when
        sut.enQueue(input1)
        sut.enQueue(input2)
        sut.enQueue(input3)
        let result = sut.enqueue
        
        //then
        XCTAssertEqual(result, ["3","6","9"])
    }
//MARK: - Calculator.deQueue
    
    
}
