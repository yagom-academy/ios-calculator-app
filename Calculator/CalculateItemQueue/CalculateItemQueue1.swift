//
//  CalculateItemQueue.swift
//  CalculateItemQueue
//
//  Created by LIMGAUI on 2022/03/17.
//

import XCTest
@testable import Calculator

class CalculateItemQueue1: XCTestCase {
    var queue: CalculateItemQueue<Int>!
    var stringQueue: CalculateItemQueue<String>!
    override func setUpWithError() throws {
        queue = CalculateItemQueue()
        stringQueue = CalculateItemQueue()
    }
    override func tearDownWithError() throws {
        queue = nil
        stringQueue = nil
    }
    
    func test_append메서드를사용하지않고_isEmpty메서드를호출했을때_False가나오는지() {
        let result = queue.isEmpty
        
        XCTAssertEqual(result, false)
    }
    
    func test_enqueue메서드호출후_isEmpty메서드호출값이_True가나오는지() {
        let result = queue.isEmpty
        
        XCTAssertTrue(result)
    }
    
    func test_enqueue메서드호출10번후_count값이10이나오는지() {
        for number in 1...10 {
            queue.enqueue(number)
        }
        let result = queue.count
        
        XCTAssertEqual(result, 10)
    }
    
    func test_enqueue메서드호출1000번후_dequeue999번후에_count값1이나오는지() {
        for number in 1...1000 {
            queue.enqueue(number)
        }
        for _ in 1...999 {
            let _ = queue.dequeue
        }
        let result = queue.count
        
        XCTAssertEqual(result, 1)
    }
    
    func test_enqueue메서드quokka값을넣고_dequeue햇을때quokka값이나오는지() {
        let input = "quokka"
        stringQueue.enqueue(input)
        
        let result = stringQueue.dequeue
        
        XCTAssertEqual(input, result)
    }
    
    func test_enqueue메서드10번호출후_removeAll메서드호출했을때_count값0이나오는지() {
        for number in 1...10 {
            queue.enqueue(number)
        }
        queue.removeAll()
        
        let result = queue.count
        
        XCTAssertEqual(result, 0)
    }
}
