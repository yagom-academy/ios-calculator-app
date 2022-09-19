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
}
