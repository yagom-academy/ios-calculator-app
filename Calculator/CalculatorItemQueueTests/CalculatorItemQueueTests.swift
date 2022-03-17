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
    
    func test_enqueue를한번호출했을때_queue의카운트가_예상값과같아야한다() {
        // given
        let input = 1
        
        // when
        sut.enqueue(input)
        
        // then
        let result = sut.count
        let expected = 1
        XCTAssertEqual(result, expected)
    }
    
    func test_enqueue와dequeue를한번씩호출했을때_queue의카운트가_예상값과같아야한다() {
        // given
        let input = 1
        
        // when
        sut.enqueue(input)
        sut.dequeue()
        
        // then
        let result = sut.count
        let expected = 0
        XCTAssertEqual(result, expected)
    }
    
    func test_enqueue와dequeue를한번씩호출했을때_isEmpty는_예상값과같아야한다() {
        // given
        let input = 1
        
        // when
        sut.enqueue(input)
        sut.dequeue()
        
        // then
        let result = sut.isEmpty
        XCTAssertTrue(result)
    }
    
    func test_enqueue를여러번호출했을때_queue의카운트는_예상값과같아야한다() {
        // given
        let input = [1,2]
        
        // when
        input.forEach {
            sut.enqueue($0)
        }
        
        // then
        let result = sut.count
        let expected = 2
        XCTAssertEqual(result, expected)
    }
    
    func test_enqueue를두번호출하고dequeue를한번호출했을때_queue의카운트는_예상값과같아야한다() {
        // given
        let input = [1,2]
        
        // when
        input.forEach {
            sut.enqueue($0)
        }
        sut.dequeue()
        
        // then
        let result = sut.count
        let expected = 1
        XCTAssertEqual(result, expected)
    }
    
    func test_enqueue를여러번호출했을때_first는_예상값과같아야한다() {
        // given
        let input = [1,2]
        
        // when
        input.forEach {
            sut.enqueue($0)
        }
        
        // then
        let result = sut.first
        let expected = 1
        XCTAssertEqual(result, expected)
    }
    
    func test_enqueue여러번하고dequeue를한번호출했을때_first는_예상값과같아야한다() {
        // given
        let input = [1,2]
        
        // when
        input.forEach {
            sut.enqueue($0)
        }
        sut.dequeue()
        
        // then
        let result = sut.first
        let expected = 2
        XCTAssertEqual(result, expected)
    }
    
    func test_enqueue여러번하고dequeue를한번호출했을때_last는_예상값과같아야한다() {
        // given
        let input = [1,2,3]
        
        // when
        input.forEach {
            sut.enqueue($0)
        }
        sut.dequeue()
        
        // then
        let result = sut.last
        let expected = 3
        XCTAssertEqual(result, expected)
    }
    
    func test_queue가비어있을때_dequeue를하면_nil을_반환해야한다() {
        // when
        let result = sut.dequeue()
        
        // then
        XCTAssertEqual(result, nil)
    }
    
    func test_clear를했을때_isEmpty는_true이여야한다() {
        // given
        let input = [1,2]
        
        // when
        input.forEach {
            sut.enqueue($0)
        }
        sut.clear()
        
        // then
        let result = sut.isEmpty
        XCTAssertTrue(result)
    }
}
