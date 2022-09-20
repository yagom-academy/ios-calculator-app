//
//  CalculatorItemQueueTests.swift
//  CalculatorItemQueueTests
//
//  Created by 김인호 on 2022/09/20.
//

import XCTest
@testable import Calculator

class CalculatorItemQueueTests: XCTestCase {
    
    func test_enqueue실행시_큐가비어있으면_입력값이_첫번째노드로_생성되는가() {
        //given
        let input = 3
        
        //when
        let queue = CalculatorItemQueue<Int>()
        queue.enqueue(element: input)
        
        //then
        XCTAssertEqual(input, queue.head?.data)
    }
    
    func test_enqueue실행시_마지막노드_뒤에_입력한노드가_추가되는가() {
        //given
        let input = 3
        
        //when
        let queue = CalculatorItemQueue<Int>()
        queue.enqueue(element: 4)
        queue.enqueue(element: 6)
        queue.enqueue(element: input)
        
        //then
        XCTAssertEqual(input, queue.head?.next?.next?.data)
    }
    
    func test_dequeue실행시_큐가비어있으면_nil이_반환되는가() {
        //given
        let queue = CalculatorItemQueue<Int>()
        
        //when
        let result = queue.dequeue()
        
        //then
        XCTAssertEqual(nil, result)
    }
    
    func test_dequeue실행시_큐의_첫번째데이터가_반환되는가() {
        //given
        let queue = CalculatorItemQueue<Int>()
        queue.enqueue(element: 3)
        queue.enqueue(element: 7)
        queue.enqueue(element: 4)
        
        //when
        let result = queue.dequeue()
        
        //then
        XCTAssertEqual(3, result)
    }
    
    func test_dequeue실행시_큐의_헤드가_다음노드로_이동하는가() {
        //given
        let queue = CalculatorItemQueue<Int>()
        queue.enqueue(element: 3)
        queue.enqueue(element: 7)
        queue.enqueue(element: 4)
        
        //when
        let _ = queue.dequeue()
        let result = queue.head?.data
        
        //then
        XCTAssertEqual(7, result)
    }
}
