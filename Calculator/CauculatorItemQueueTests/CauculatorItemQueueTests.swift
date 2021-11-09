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

    func test_dequeue호출시_빈배열일시_nil을반환하는지() {
        // given
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
        XCTAssertTrue(sut.count == 1 && sut.front == 7)
    }
}
