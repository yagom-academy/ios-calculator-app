//
//  CalculatorTests.swift
//  CalculatorTests
//
//  Created by 김태훈 on 2022/03/15.
//

import XCTest
@testable import Calculator

class CalculatorTests: XCTestCase {
    var sut: CalculatorItemQueue<Double>!

    override func setUpWithError() throws {
        try super.setUpWithError()
        sut = CalculatorItemQueue()
    }

    override func tearDownWithError() throws {
        try super.tearDownWithError()
        sut = nil
    }
    
    func test_enqueue가_정상적으로_1이_들어가는지() {
        //given
        let input = 1.0
        //when
        sut.enqueue(value: input)
        let result = sut.first
        //then
        XCTAssertEqual(result, 1.0)
    }
    
    func test_isEmpty가_정상적으로_작동되는지() {
        //given
        let input = 1.0
        //when
        sut.enqueue(value: input)
        let _ = sut.dequeue()
        //then
        XCTAssertTrue(sut.isEmpty)
    }
    
    func test_enqueue를_두번_했을때_처음과_마지막에_정상적으로_enqueue되는지(){
        //given
        let input = 1.0
        let input2 = 2.0
        //when
        sut.enqueue(value: input)
        sut.enqueue(value: input2)
        //then
        XCTAssertEqual(sut.first, 1.0)
        XCTAssertEqual(sut.last, 2.0)
    }
    
    func test_count를_정상적으로_세고있는지() {
        //givne
        let input = 1.0
        let input2 = 2.0
        let input3 = 3.0
        //when
        sut.enqueue(value: input)
        sut.enqueue(value: input2)
        sut.enqueue(value: input3)
        //then
        XCTAssertEqual(sut.count, 3)
    }
    
    func test_dequeue가_정상적으로_1이_삭제되는지() {
        //given
        let input = 1.0
        let input2 = 2.0
        //when
        sut.enqueue(value: input)
        sut.enqueue(value: input2)
        //then
        XCTAssertEqual(sut.dequeue(), 1.0)
    }
    
    func test_dequeue와_enqueue가_정상적으로_작동하는지(){
        //when
        sut.enqueue(value: 1)
        sut.enqueue(value: 2)
        let _ = sut.dequeue()
        sut.enqueue(value: 3)
        sut.enqueue(value: 4)
        let _ = sut.dequeue()
        let _ = sut.dequeue()
        let _ = sut.dequeue()
        //then
        XCTAssertEqual(sut.head, 4)
    }
    
    func test_head의_값을_제대로_가져오는지() {
        //given
        let input = 1.0
        let input2 = 2.0
        //when
        sut.enqueue(value: input)
        sut.enqueue(value: input2)
        sut.enqueue(value: input)
        sut.enqueue(value: input2)
        let _ = sut.dequeue()
        //then
        XCTAssertEqual(sut.head, 2.0)
    }
}
