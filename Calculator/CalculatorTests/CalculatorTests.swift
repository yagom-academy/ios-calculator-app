//
//  CalculatorTests.swift
//  CalculatorTests
//
//  Created by 김민성 on 2023/05/30.
//

import XCTest
@testable import Calculator

final class CalculatorTests: XCTestCase {
    var sut: CalculatorItemQueue<Int>!
    
    override func setUpWithError() throws {
        try super.setUpWithError()
        sut = CalculatorItemQueue<Int>()
    }

    override func tearDownWithError() throws {
        try super.tearDownWithError()
        sut = nil
    }
    
    func test_CalculatorItemQueue를_초기화하면_빈_queue가_생성된다() {
        // given
        sut = CalculatorItemQueue<Int>()
        
        //when
        let result = sut.isEmpty
       
        //then
        XCTAssertTrue(result)
    }
    
    func test_5개의_요소를_enqueue하면_queue안에_5개의_요소가_추가된다() {
        // given
        sut.enqueue(1)
        sut.enqueue(2)
        sut.enqueue(3)
        sut.enqueue(4)
        sut.enqueue(5)
        
        let expectation = 5
        
        // when
        let result = sut.count
        
        // then
        XCTAssertEqual(result, expectation)
    }
    
    func test_3개의_요소가_들어있는_queue에_2번_dequeue하면_1개의_요소가_남아있다() {
        // given
        sut.enqueue(1)
        sut.enqueue(2)
        sut.enqueue(3)
        
        _ = sut.dequeue()
        _ = sut.dequeue()
        
        let expectation = 1
        
        // when
        let result = sut.count
        
        // then
        XCTAssertEqual(result, expectation)
    }
    
    func test_dequeue_하면_가장_먼저_enqueue된_요소가_반환된다() {
        // given
        sut.enqueue(1)
        sut.enqueue(2)
        sut.enqueue(3)
        
        let expectation = 1
        
        // when
        let result = sut.dequeue()
        
        // then
        XCTAssertEqual(result, expectation)        
    }
    
    func test_queue가_비어있을때_dequeue를_호출하면_nil을_반환한다() {
        // when
        let result = sut.dequeue()
        
        // then
        XCTAssertNil(result)
    }
    
    func test_queue에_n개의_요소가_존재할_때_clear를_호출하면_queue의_요소가_모두_사라진다() {
        //given
        let n = Int.random(in: 5...15)
        
        for number in 0...n {
            sut.enqueue(number)
        }
        
        // when
        sut.clear()
        
        // then
        XCTAssertTrue(sut.isEmpty)
    }
}
