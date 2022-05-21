//
//  Test_CalculatorItemQueue.swift
//  Test_CalculatorItemQueue
//
//  Created by 허건 on 2022/05/20.
//

import XCTest
@testable import Calculator

class Test_CalculatorItemQueue: XCTestCase {
    var sut: CalculatorItemQueue<[Int]>!
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        sut = CalculatorItemQueue()
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        sut = nil
    }
    
    func test_enqueue_실행시_123456_를넣었을때_123456_를반환하는지() {
        // given
        let input: [Int] = [1, 2, 3, 4, 5, 6]
        let output: [Int] = [1, 2, 3, 4, 5, 6]
        var result: [Int] = []

        // when
        input.forEach {
            sut.enqueue([$0])
        }
        
        guard let linkedListQueue = sut.linkedList.head?.data else {
            return
        }
        
        while sut.linkedList.head != nil {
            result.append(linkedListQueue[0])
        }
        
        // then
        XCTAssertEqual(result, output)
    }
    
    func test_dequeue_실행시_123456_를넣었을때_23456_를반환하는지() {
        // given
        let input: [Int] = [1, 2, 3, 4, 5, 6]
        let output: [Int] = [2, 3, 4, 5, 6]
        var result: [Int] = []
        var node = sut.linkedList.head

        // when
        input.forEach {
            sut.enqueue([$0])
        }
        sut.dequeue()

        while node != nil {
            guard let nodeData = node?.data else {
                return
            }
            nodeData.forEach {
                result.append($0)
            }
            node = node?.next
        }

        // then
        XCTAssertEqual(result, output)
    }
    
}
