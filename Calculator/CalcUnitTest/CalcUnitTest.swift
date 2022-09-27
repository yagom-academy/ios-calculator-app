//
//  CalcUnitTest.swift
//  CalcUnitTest
//
//  Created by 서현웅 on 2022/09/20.
//

import XCTest
@testable import Calculator

class CalcUnitTest: XCTestCase {

    var sut: CalculatorItemQueue<Double>!
    
    override func setUpWithError() throws {
        try super.setUpWithError()
        sut = CalculatorItemQueue()
    }

    override func tearDownWithError() throws {
        try super.tearDownWithError()
        sut = nil
    }

    func test_큐가비어있을때_enqueue함수_입력여부체크() {
        //given
        let inputFirst = 1.5
        let inputSecond = 2.5
        //when
        sut.enqueue(inputFirst)
        sut.enqueue(inputSecond)
        //then
        XCTAssertEqual(sut.queue, [1.5, 2.5])
    }
    
    func test_큐가비어있을때_dequeue함수_nil반환여부체크() {
        //given
        
        //when
        let result = sut.dequeue()
        //then
        XCTAssertEqual(result, nil)
    }
    
    func test_큐에값이있을때_dequeue함수_제거여부체크() {
        //given
        sut.enqueue(1.0)
        sut.enqueue(2.0)
        sut.enqueue(2.5)
        //when
        let _ = sut.dequeue()
        //then
        XCTAssertEqual(sut.queue, [2.0, 2.5])
    }
    
    
    func test_큐에값이있을때_dequeue함수_첫번째값반환여부() {
        //given
        sut.enqueue(1.0)
        sut.enqueue(2.0)
        sut.enqueue(2.5)
        // when
        let result = sut.dequeue()
        //then
        XCTAssertEqual(result, 1.0)
    }

    func test_큐에값이있을때_clear함수_제거여부체크() {
        //given
        sut.enqueue(1.0)
        sut.enqueue(2.0)
        sut.enqueue(3.0)
        //when
        sut.clear()
        //then
        XCTAssertEqual(sut.queue, [])
    }
    
}
