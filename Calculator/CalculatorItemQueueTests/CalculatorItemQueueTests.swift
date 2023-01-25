//
//  CalculatorItemQueueTests.swift
//  CalculatorItemQueueTests
//
//  Created by 천승현 on 2023/01/25.
//

import XCTest

final class CalculatorItemQueueTests: XCTestCase {

    var sut: CalculatorItemQueue<String>!
    
    override func setUpWithError() throws {
        sut = CalculatorItemQueue()
    }

    override func tearDownWithError() throws {
        sut = nil
    }

    func test_enqueueCurrentItem호출시_3을넣으면_enqueueStack이3을포함한다() {
        // given
        let input = "3"
        let expectation = true
        
        // when
        sut.enqueueCurrentItem(input)
        let result = sut.enqueueStack.contains("3")
        
        // then
        XCTAssertEqual(result, expectation)
    }
    
    func test_dequeueCurrentItem호출시_dequeueStack이비어있다면_reversed된enqueueStack이들어간다() {
        // given
        let input = ["1", "+", "3"]
        let expectation = ["3", "+", "1"]
        
        // when
        input.forEach { sut.enqueueCurrentItem($0) }
        
        sut.dequeueCurrentItem()
        let result = sut.dequeueStack
        
        // then
        XCTAssertEqual(result, expectation)
    }
    
    func test_dequeueCurrentItem호출시_dequeueStack이비어있다면_enqueueStack이비워진다() {
        // given
        let input = ["1", "2", "3"]
        let expectation = true
        
        // when
        input.forEach { sut.enqueueCurrentItem($0) }
        sut.dequeueCurrentItem()
        let result = sut.enqueueStack.isEmpty
        
        // then
        XCTAssertEqual(result, expectation)
    }
    
    func test_dequeueCurrentItem호출시_dequeueStack이비어있지않다면_dequeueStack의마지막값을반환한다() {
        // given
        let input = ["1", "2", "3", "4", "5"]
        let expectation = "2"
        
        // when
        input.forEach { sut.enqueueCurrentItem($0) }
        sut.dequeueCurrentItem()
        let result = sut.dequeueCurrentItem()
        
        // then
        XCTAssertEqual(result, expectation)
    }
    
    
    

}
