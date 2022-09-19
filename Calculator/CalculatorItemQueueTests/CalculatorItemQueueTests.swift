//
//  CalculatorItemQueueTests.swift
//  CalculatorItemQueueTests
//
//  Created by Ayaan on 2022/09/19.
//

import XCTest

class CalculatorItemQueueTests: XCTestCase {

    func test_입력값_1_이_enqueue되어서_queue의_head의_data가_input과_같은가() {
        //given
        let input = 1
        
        //when
        var queue: CalculatorItemQueue<Int> = CalculatorItemQueue<Int>()
        queue.enqueue(input)
        
        //then
        XCTAssertEqual(input, queue.head?.data)
    }
    
    func test_입력값_1_2_이_순서대로_enqueue되어서_queue의_head의_data가_1이고_tail의_data가_2인가() {
        //given
        let input = [1,2]
        
        //when
        var queue: CalculatorItemQueue<Int> = CalculatorItemQueue<Int>()
        queue.enqueue(input[0])
        queue.enqueue(input[1])
        
        //then
        XCTAssertEqual(input[0], queue.head?.data)
        XCTAssertEqual(input[1], queue.tail?.data)
    }
    
    func test_입력값_1_2_3_이_순서대로_enqueue되어서_queue의_head의_data가_1이고_tail의_data가_3인가() {
        //given
        let input = [1,2,3]
        
        //when
        var queue: CalculatorItemQueue<Int> = CalculatorItemQueue<Int>()
        queue.enqueue(input[0])
        queue.enqueue(input[1])
        queue.enqueue(input[2])
        
        //then
        XCTAssertEqual(input[0], queue.head?.data)
        XCTAssertEqual(input[2], queue.tail?.data)
    }
    
    func test_빈_queue의_dequeue의_값이_nil인가() {
        //when
        let queue: CalculatorItemQueue<Int> = CalculatorItemQueue<Int>()
        
        //then
        XCTAssertEqual(nil, queue.dequeue())
    }
    
    func test_입력값_1_이_enqueue되어서_queue의_dequeue의_값이_input과_같은가() {
        //given
        let input = 1
        
        //when
        var queue: CalculatorItemQueue<Int> = CalculatorItemQueue<Int>()
        queue.enqueue(input)
        
        //then
        XCTAssertEqual(input, queue.dequeue())
    }
    
    func test_입력값_1_2_3_이_순서대로_enqueue되어서_queue의_dequeue의_값이_첫번째_input값과_같은가() {
        //given
        let input = [1,2,3]
        
        //when
        var queue: CalculatorItemQueue<Int> = CalculatorItemQueue<Int>()
        queue.enqueue(input[0])
        queue.enqueue(input[1])
        queue.enqueue(input[2])
        
        //then
        XCTAssertEqual(input[0], queue.dequeue())
    }
    
    func test_입력값_1_2_3_이_순서대로_enqueue되어서_queue의_dequeue의_값이_input값과_순서가_같은가() {
        //given
        let input = [1,2,3]
        
        //when
        var queue: CalculatorItemQueue<Int> = CalculatorItemQueue<Int>()
        queue.enqueue(input[0])
        queue.enqueue(input[1])
        queue.enqueue(input[2])
        
        //then
        XCTAssertEqual(input[0], queue.dequeue())
        XCTAssertEqual(input[1], queue.dequeue())
        XCTAssertEqual(input[2], queue.dequeue())
    }
}
