//
//  CalculatorItemQueueTests.swift
//  CalculatorItemQueueTests
//
//  Created by Ayaan on 2022/09/19.
//

import XCTest

extension Int: CalculateItem { }

class CalculatorItemQueueTests: XCTestCase {
    var sut: CalculatorItemQueue<Int>!
    
    override func setUpWithError() throws {
        try super.setUpWithError()
        sut = CalculatorItemQueue()
    }
    
    override func tearDownWithError() throws {
        try super.tearDownWithError()
        sut = nil
    }

    func test_입력값_1_이_enqueue되어서_queue의_head의_data가_input과_같은가() {
        //given
        let input = 1
        
        //when
        sut.enqueue(input)
        
        //then
        XCTAssertEqual(input, sut.head?.data)
    }
    
    func test_입력값_1_2_이_순서대로_enqueue되어서_queue의_head의_data가_1이고_tail의_data가_2인가() {
        //given
        let input = [1,2]
        
        //when
        sut.enqueue(input[0])
        sut.enqueue(input[1])
        
        //then
        XCTAssertEqual(input[0], sut.head?.data)
        XCTAssertEqual(input[1], sut.tail?.data)
    }
    
    func test_입력값_1_2_3_이_순서대로_enqueue되어서_queue의_head의_data가_1이고_tail의_data가_3인가() {
        //given
        let input = [1,2,3]
        
        //when
        sut.enqueue(input[0])
        sut.enqueue(input[1])
        sut.enqueue(input[2])
        
        //then
        XCTAssertEqual(input[0], sut.head?.data)
        XCTAssertEqual(input[2], sut.tail?.data)
    }
    
    func test_빈_queue의_dequeue의_값이_nil인가() {
        //when
        sut = CalculatorItemQueue<Int>()
        
        //then
        XCTAssertEqual(nil, sut.dequeue())
    }
    
    func test_입력값_1_이_enqueue되어서_queue의_dequeue의_값이_input과_같은가() {
        //given
        let input = 1
        
        //when
        sut.enqueue(input)
        
        //then
        XCTAssertEqual(input, sut.dequeue())
    }
    
    func test_입력값_1_2_3_이_순서대로_enqueue되어서_queue의_dequeue의_값이_첫번째_input값과_같은가() {
        //given
        let input = [1,2,3]
        
        //when
        sut.enqueue(input[0])
        sut.enqueue(input[1])
        sut.enqueue(input[2])
        
        //then
        XCTAssertEqual(input[0], sut.dequeue())
    }
    
    func test_입력값_1_2_3_이_순서대로_enqueue되어서_queue의_dequeue의_값이_input값과_순서가_같은가() {
        //given
        let input = [1,2,3]
        
        //when
        sut.enqueue(input[0])
        sut.enqueue(input[1])
        sut.enqueue(input[2])
        
        //then
        XCTAssertEqual(input[0], sut.dequeue())
        XCTAssertEqual(input[1], sut.dequeue())
        XCTAssertEqual(input[2], sut.dequeue())
    }
    
    func test_빈_queue의_peak의_값이_nil인가() {
        //given
        
        //when
        sut = CalculatorItemQueue<Int>()

        //then
        XCTAssertEqual(nil, sut.peek())
    }
    
    func test_여러개의_입력값중_가장_첫번째_입력된_값을_출력하는_peak이_첫번째_입력된_값과_같은가() {
        //given
        let input = [1,2,3,4,5]
        
        //when
        input.forEach {
            sut.enqueue($0)
        }
        
        //then
        XCTAssertEqual(input[0], sut.peek())
    }
}
