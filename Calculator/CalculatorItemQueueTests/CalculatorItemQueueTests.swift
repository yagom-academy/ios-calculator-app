//
//  CalculatorItemQueueTests.swift
//  CalculatorItemQueueTests
//
//  Created by 조민호 on 2022/03/14.
//

import XCTest
@testable import Calculator

class CalculatorItemQueueTests: XCTestCase {

    var sut: CalculatorItemQueue<Int>!
    
    override func setUpWithError() throws {
        try super.setUpWithError()
        sut = CalculatorItemQueue<Int>()
    }

    override func tearDownWithError() throws {
        try super.tearDownWithError()
        sut = nil
    }
    
    func test_1을_enqueue했을때_값이정상적으로추가되는지() {
        // given
        let input = 1
        
        // when
        sut.enqueue(input)
        
        // then
        XCTAssertEqual(sut.currentInputStack.first, 1)
    }
    
    func test_dequeue했을때_값이정상적으로빠져나가는지() {
        // given
        let input = 1
        
        // when
        sut.enqueue(input)
        let result = sut.dequeue()

        // then
        XCTAssertEqual(result, input)
    }
    
    func test_outputStack이_비어있을때_dequeue하는경우_값이정상적으로빠져나가는지() {
        // given
        let input = [1,2,3]
        
        // when
        sut.enqueue(input[0])
        sut.enqueue(input[1])
        sut.enqueue(input[2])
        sut.dequeue()
        
        // then
        let result = sut.currentOutputStack
        let expected = [3, 2]
        XCTAssertEqual(result, expected)
    }
    
    func test_queue가_비어있는지() {
        // given
        let input = [1]
        
        // when
        sut.enqueue(input[0])
        sut.dequeue()
        
        // then
        let result = sut.isEmpty
        XCTAssertTrue(result)
    }
    
    func test_enqueue를두번했을때_현재queue의_개수가2개인지() {
        // given
        let input = [1,2]
        
        // when
        sut.enqueue(input[0])
        sut.enqueue(input[1])
        
        // then
        let result = sut.count
        let expected = 2
        XCTAssertEqual(result, expected)
    }
    
    func test_enqueue를두번하고_dequeue를한번했을때_현재queue의_개수가1개인지() {
        // given
        let input = [1,2]
        
        // when
        sut.enqueue(input[0])
        sut.enqueue(input[1])
        sut.dequeue()
        
        // then
        let result = sut.count
        let expected = 1
        XCTAssertEqual(result, expected)
    }
    
    func test_1_2를enqueue했을때_첫번째요소가_1이맞는지() {
        // given
        let input = [1,2]
        
        // when
        sut.enqueue(input[0])
        sut.enqueue(input[1])
        
        // then
        let result = sut.front
        let expected = 1
        XCTAssertEqual(result, expected)
    }
}
