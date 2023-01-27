//
//  CalculatorItemQueueTests.swift
//  CalculatorItemQueueTests
//
//  Created by Christy Lee on 2023/01/26.
//

import XCTest

final class CalculatorItemQueueTests: XCTestCase {
    var sut: CalculatorItemQueue<String>!
    
    override func setUpWithError() throws {
        sut = CalculatorItemQueue<String>()
    }
    
    override func tearDownWithError() throws {
        sut = nil
    }
    
    func test_데이터가_비어있을때_isEmpty호출시_True를반환한다() {
        //given
        sut.data = []
        
        //when
        let result = sut.isEmpty()
        
        //then
        XCTAssertTrue(result)
    }
    
    func test_데이터가_들어있을때_isEmpty호출시_False를반환한다() {
        //given
        sut.data = ["1", "2", "3"]
        
        //when
        let result = sut.isEmpty()
        
        //then
        XCTAssertFalse(result)
    }
    
    func test_데이터가_들어있을때_count호출시_갯수를반환한다() {
        //given
        sut.data = ["1", "2", "3", "4", "5"]
        let expectation = 5
        
        //when
        let result = sut.count
        
        //then
        XCTAssertEqual(result, expectation)
    }
    
    func test_clearAllNumbers호출시_배열에있는_data를_전부삭제한다() {
        // given
        sut.data = ["1", "2", "3"]
        let expectation = 0

        // when
        sut.clearAll()
        let result = sut.count

        // then
        XCTAssertEqual(result, expectation)
    }
    
    func test_데이터가_들어있을때_peek호출시_첫번째요소를_불러온다() {
        // given
        sut.data = ["1", "2", "3"]
        let expectation = "1"

        // when
        let result = sut.peek()

        // then
        XCTAssertEqual(result, expectation)
    }
    
    func test_데이터가_비어있을때_peek호출시_nil을_반환한다() {
        // given
        sut.data = []

        // when
        let result = sut.peek()

        // then
        XCTAssertNil(result)
    }
    
    func test_enqueue수행시_큐의_마지막에_요소가_추가된다() {
        // given
        sut.data = ["1", "2", "3", "4"]
        let expectation = ["1", "2", "3", "4", "5"]

        // when
        sut.enqueue("5")

        // then
        XCTAssertEqual(sut.data, expectation)
    }
    
    func test_데이터가_비어있을때_dequeue호출시_nil을_반환한다() {
        // given
        sut.data = []
        
        // when
        let result = sut.dequeue()
        
        // then
        XCTAssertNil(result)
    }
    
    func test_데이터가_있을때_dequeue호출시_첫번째요소를_불러오고_제거한다() {
        // given
        sut.data = ["1", "2", "3", "4"]
        let expectation = "1"
        let countExpectation = 3
        
        // when
        let result = sut.dequeue()
        let countResult = sut.count
        
        // then
        XCTAssertEqual(result, expectation)
        XCTAssertEqual(countResult, countExpectation)
    }
}
