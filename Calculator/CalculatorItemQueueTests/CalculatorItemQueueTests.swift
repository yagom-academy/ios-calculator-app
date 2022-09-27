//
//  CalculatorItemQueueTests.swift
//  CalculatorItemQueueTests
//
//  Created by 써니쿠키 on 2022/09/20.
//

import XCTest
@testable import Calculator

class CalculatoralculatorItemQueueTests: XCTestCase {
    var sut: CalculatorItemQueue<Double>!

    override func setUpWithError() throws {
        try super.setUpWithError()
        sut = CalculatorItemQueue()
    }

    override func tearDownWithError() throws {
        try super.tearDownWithError()
        sut = nil
    }
    
    func test_초기화후에큐는비어있다() {
        //given: setUp메서드에서 초기화로 리스트가 비어있을 때
        //when, then: 큐는 비어있다.
        XCTAssertTrue(sut.isEmpty)
    }

    func test_enqueue_큐가비어있을때_10추가시_마지막값_10() {
        //given: setUp메서드에서 초기화로 리스트가 비어있을 때
        //when: 10추가 시
        sut.enqueue(1.0)
        
        //then: 10이 마지막값으로 추가된다.
        let lastData = sut.itemQueue?.last?.data
        XCTAssertEqual(1.0, lastData)
        
        //의도한 fail test
        XCTAssertNotEqual(2.0, lastData)
    }
    
    func test_enqueue_큐가비어있지않을때_2추가시_마지막값_2() {
        //given: 1이 담겨있을 때
        sut.enqueue(1.0)
        
        //when: 2 추가 시
        sut.enqueue(2.0)
        
        //then: 2가 마지막값으로 추가된다.
        let lastData = sut.itemQueue?.last?.data
        XCTAssertEqual(2.0, lastData)
        
        //의도한 fail test
        XCTAssertNotEqual(3.0, lastData)
    }
    
    func test_dequeue_큐가비어있을때_반환값nil() {
        //given: setUp메서드에서 초기화로 리스트가 비어있을 때
        //when, then: 반환값은 nil이다.
        XCTAssertNil(sut.dequeue()?.data)
    }
    
    func test_dequeue_큐가비어있지않을때_제거되고_반환하는값은_첫번째값() {
        //given 1,2,3이 담겨 있을 때
        sut.enqueue(1.0)
        sut.enqueue(2.0)
        sut.enqueue(3.0)
        
        //when: dequeue메서드 사용시
        let firstData = sut.dequeue()?.data
        
        //then: 제거되고 반환되는 값은 1이다
        XCTAssertNotEqual(1.0, sut.itemQueue?.head?.data)
        XCTAssertEqual(1.0, firstData)
       
        //의도한 fail test
        XCTAssertNotEqual(2.0, firstData)
    }

    func test_clear_큐에담긴값들을지워준다() {
        //given  1,2,3이 담겨 있을 때
        sut.enqueue(1.0)
        sut.enqueue(2.0)
        sut.enqueue(3.0)
        
        //when 지워주면
        sut.clear()
        
        //then 비어있는큐가된다.
        XCTAssertTrue(sut.isEmpty)
    }
}
