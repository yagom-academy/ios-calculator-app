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

    func test_input값_1을_CalculatorItemQueue에_순서대로_enqueue하면_head의_data가_1인가() {
        //given
        let input = 1
        
        //when
        sut.enqueue(input)
        
        //then
        XCTAssertEqual(input, sut.head?.data)
    }
    
    func test_input값_1_2를_CalculatorItemQueue에_순서대로_enqueue하면_head의_data가_1이고_tail의_data가_2인가() {
        //given
        let input = [1,2]
        
        //when
        input.forEach {
            sut.enqueue($0)
        }
        
        //then
        XCTAssertEqual(input[0], sut.head?.data)
        XCTAssertEqual(input[1], sut.tail?.data)
    }
    
    func test_input값_1_2_3을_CalculatorItemQueue에_순서대로_enqueue하면_head의_data가_1이고_tail의_data가_3인가() {
        //given
        let input = [1,2,3]
        
        //when
        input.forEach {
            sut.enqueue($0)
        }
        
        //then
        XCTAssertEqual(input[0], sut.head?.data)
        XCTAssertEqual(input[2], sut.tail?.data)
    }
    
    func test_빈_CalculatorItemQueue를_dequeue하면_반환값이_nil인가() {
        //when
        sut = CalculatorItemQueue<Int>()
        
        //then
        XCTAssertEqual(nil, sut.dequeue())
    }
    
    func test_input값_1을_CalculatorItemQueue에_enqueue한후_dequeue를_하면_반환값이_input값과_같은가() {
        //given
        let input = 1
        
        //when
        sut.enqueue(input)
        let result: Int? = sut.dequeue()
        
        //then
        XCTAssertEqual(input, result)
    }
    
    func test_input값_1_2_3을_CalculatorItemQueue에_순서대로_enqueue한후_dequeue하면_반환한값이_input의_첫번째값과_같은가() {
        //given
        let input = [1,2,3]
        
        //when
        input.forEach {
            sut.enqueue($0)
        }
        
        //then
        XCTAssertEqual(input[0], sut.dequeue())
    }
    
    func test_input값_1_2_3을_CalculatorItemQueue에_순서대로_enqueue한후_dequeue하면_반환한값이_input값과_같은가() {
        //given
        let input = [1,2,3]
        
        //when
        input.forEach {
            sut.enqueue($0)
        }
        
        //then
        XCTAssertEqual(input[0], sut.dequeue())
        XCTAssertEqual(input[1], sut.dequeue())
        XCTAssertEqual(input[2], sut.dequeue())
    }
    
    func test_빈_CalculatorItemQueue를_peak하면_반환한값이_nil인가() {
        //given
        
        //when
        sut = CalculatorItemQueue<Int>()

        //then
        XCTAssertEqual(nil, sut.peek())
    }
    
    func test_input값_1_2_3_4_5를_CalculatorItemQueue에_enqueue한후_peak하면_반환한값이_input값의_첫번째_값과_같은가() {
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
