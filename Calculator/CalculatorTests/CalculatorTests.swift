//
//  CalculatorTests.swift
//  CalculatorTests
//
//  Created by yyss99 on 2023/06/03.
//

import XCTest
@testable import Calculator

final class CalculatorTests: XCTestCase {
    var sut: CalculatorItemQueue<String>!
    
    override func setUpWithError() throws {
        try super.setUpWithError()
        sut = CalculatorItemQueue()
    }

    override func tearDownWithError() throws {
        try super.tearDownWithError()
        sut = nil
    }
    
    func test_큐가_비었을때_isEmpty가_true이다() {
        //given
        let expectation = true
        //when
        let result = sut.isEmpty
        //then
        XCTAssertEqual(expectation, result)
    }
    
    func test_enqueue_실행시_isEmpty가_false이다() {
        //given
        let expectation = false
        //when
        sut.enqueue("3")
        let result = sut.isEmpty
        //then
        XCTAssertEqual(expectation, result)
    }
    
    func test_count가_node의_수와_같다() {
        //given
        let expectation = 3
        //when
        sut.enqueue("1")
        sut.enqueue("2")
        sut.enqueue("3")
        let result = sut.count
        //then
        XCTAssertEqual(expectation, result)
    }
    
    func test_dequeue_실행시_Node의_수가_하나_줄어든다() {
        //given
        let expectation1 = 2
        let expectation2 = "1"
        //when
        sut.enqueue("1")
        sut.enqueue("2")
        sut.enqueue("3")
        let result2 = sut.dequeue()
        let result1 = sut.count
        //then
        XCTAssertEqual(expectation1, result1)
        XCTAssertEqual(expectation2, result2)
    }
    
    func test_dequeue_호출시_해당_Node의_value를_반환한다() {
        //given
        let expectation = "1"
        //when
        sut.enqueue("1")
        let result = sut.dequeue()
        //then
        XCTAssertEqual(expectation, result)
    }
    
    func test_clear메서드_실행시_isEmpty는_true_이다() {
        //given
        let expectation = true
        //when
        sut.enqueue("1")
        sut.enqueue("2")
        sut.enqueue("3")
        sut.clear()
        let result = sut.isEmpty
        //then
        XCTAssertEqual(expectation, result)
    }
}
