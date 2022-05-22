//
//  CalculatorItemQueueTests.swift
//  CalculatorItemQueueTests
//
//  Created by Minseong Kang on 2022/05/18.
//

import XCTest
@testable import Calculator

class CalculatorItemQueueTests: XCTestCase {
    // MARK: - Properties
    
    var sut: CalculatorItemQueue<Double>!
    
    // MARK: - Action
    
    override func setUpWithError() throws {
        sut = CalculatorItemQueue()
    }

    override func tearDownWithError() throws {
        sut = nil
    }
    
    // MARK: - peek 연산프로퍼티
    
    func test_peek연산프로퍼티_1과2를넣으면_먼저넣은_1을_반환한다() {
        // given
        let firstNumber = 1.0, secondNumber = 2.0
        sut.enqueue(firstNumber)
        sut.enqueue(secondNumber)
        
        // when
        let result = sut.peek
        
        // then
        XCTAssertEqual(result, firstNumber)
    }
    
    
    
    // MARK: - enqueue(_:)
    
    func test_enqueue의아규먼트로_0을_넣었을때_queue가빈배열이면_False() {
        // given
        let number = 0.0
        
        // when
        sut.enqueue(number)
        let result = sut.queue.isEmpty()
        
        // then
        XCTAssertFalse(result)
    }
    
    func test_enqueue의아규먼트로_0을_넣었을때_queue에_0이있으면_True() {
        // given
        let number = 0.0
        
        // when
        sut.enqueue(number)
        let result = sut.queue.head
        
        // then
        XCTAssertEqual(result?.data, number)
    }
    
    // MARK: - dequeue()
        
    func test_queue가_빈배열일때_dequeue호출시_nil을_반환하는지() {
        // given
        // sut의 초기화시 queue는 빈 배열이 되므로 생략
        
        // when
        let result = sut.dequeue()
        
        // then
        XCTAssertNil(result)
    }
    
    func test_queue의_요소가_여러개일때_dequeue호출시_첫번째요소를_리턴하는지() {
        // given
        let firstNumber = 1.0
        sut.enqueue(firstNumber)
        sut.enqueue(2.0)
        sut.enqueue(3.0)
        
        // when
        let result = sut.dequeue()
        
        // then
        XCTAssertEqual(firstNumber, result?.data)
    }
    
    // MARK: - isEmpty()
    
    func test_isEmpty메서드_Queue에_요소가_없을때_true를_반환한다() {
        // when
        let result = sut.isEmpty()
        
        // then
        XCTAssertTrue(result)
    }
    
    func test_isEmpty메서드_Queue에_요소가_있으면_false를_반환한다() {
        // given
        let number = 1.0
        sut.enqueue(number)
        
        // when
        let result = sut.isEmpty()
        
        // then
        XCTAssertFalse(result)
    }
}
