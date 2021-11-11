//
//  CauculatorItemQueueTests.swift
//  CauculatorItemQueueTests
//
//  Created by Jae-hoon Sim on 2021/11/08.
//

import XCTest
@testable import Calculator

class CauculatorItemQueueTests: XCTestCase {
    var sut: CalculatorItemQueue<Int>!

    override func setUpWithError() throws {
        try super.setUpWithError()
        sut = CalculatorItemQueue<Int>()
    }
    override func tearDownWithError() throws {
        try super.tearDownWithError()
        sut = nil
    }
    
    // MARK:- enqueue(_ item:) tests
    func test_enqueue호출시_4를전달하면_list에4가추가되는지() {
        //given
        let input = 4
        //when
        sut.enqueue(input)
        let result = sut.front
        //then
        XCTAssertEqual(result, 4)
        XCTAssertEqual(sut.count, 1)
    }
    
    // MARK:- dequeue() tests
    func test_dequeue호출시_빈배열일시_nil을반환하는지() {
        //given
        guard sut.isEmpty else {
            XCTFail()
            return
        }
        //when
        let result = sut.dequeue()
        //then
        XCTAssertEqual(result, nil)
    }
    func test_4가있는큐에서_dequeue호출시_4를반환하고_list가비워지는지() {
        //given
        sut.enqueue(4)
        //when
        let result = sut.dequeue()
        //then
        XCTAssertEqual(result, 4)
        XCTAssertTrue(sut.isEmpty)
    }
    func test_4와7이있는큐에서_dequeue호출시_4를반환하고_list에7이남는지() {
        //given
        sut.enqueue(4)
        sut.enqueue(7)
        //when
        let result = sut.dequeue()
        //then
        XCTAssertEqual(result, 4)
        XCTAssertEqual(sut.count, 1)
        XCTAssertTrue(sut.count == 1 && sut.front == 7)
    }
    
    // MARK:- isEmpty tests
    func test_빈큐에서_isEmpty를요청하면_true반환하는지() {
        //given
        guard sut.isEmpty else {
            XCTFail()
            return
        }
        //when
        let result = sut.isEmpty
        //then
        XCTAssertTrue(result)
    }
    func test_4가있는큐에서_isEmpty를요청하면_false반환하는지() {
        //given
        sut.enqueue(4)
        //when
        let result = sut.isEmpty
        //then
        XCTAssertFalse(result)
    }
    
    // MARK:- front tests
    func test_빈큐에서_front를요청하면_nil반환하는지() {
        //given
        guard sut.isEmpty else {
            XCTFail()
            return
        }
        //when
        let result = sut.front
        //then
        XCTAssertNil(result)
    }
    func test_4추가한큐에서_front를요청하면_4반환하는지() {
        //given
        sut.enqueue(4)
        //when
        let result = sut.front
        //then
        XCTAssertEqual(result, 4)
    }
    func test_4와7추가한큐에서_front를요청하면_4반환하는지() {
        //given
        sut.enqueue(4)
        sut.enqueue(7)
        //when
        let result = sut.front
        //then
        XCTAssertEqual(result, 4)
    }
    
    // MARK:- count tests
    func test_빈큐에서_count를요청하면_0반환하는지() {
        //given
        guard sut.isEmpty else {
            XCTFail()
            return
        }
        //when
        let result = sut.count
        //then
        XCTAssertEqual(result, 0)
    }
    func test_4추가한큐에서_count요청하면_1반환하는지() {
        //given
        sut.enqueue(4)
        //when
        let result = sut.count
        //then
        XCTAssertEqual(result, 1)
    }
    func test_4와7추가한큐에서_count요청하면_2반환하는지() {
        //given
        sut.enqueue(4)
        sut.enqueue(7)
        //when
        let result = sut.count
        //then
        XCTAssertEqual(result, 2)
    }
    
    // MARK:- rear tests
    func test_빈큐에서_rear를요청하면_nil반환하는지() {
        //given
        guard sut.isEmpty else {
            XCTFail()
            return
        }
        //when
        let result = sut.rear
        //then
        XCTAssertNil(result)
    }
    func test_4추가한큐에서_rear를요청하면_4반환하는지() {
        //given
        sut.enqueue(4)
        //when
        let result = sut.rear
        //then
        XCTAssertEqual(result, 4)
    }
    func test_4와7추가한큐에서_rear를요청하면_7반환하는지() {
        //given
        sut.enqueue(4)
        sut.enqueue(7)
        //when
        let result = sut.rear
        //then
        XCTAssertEqual(result, 7)
    }
}
