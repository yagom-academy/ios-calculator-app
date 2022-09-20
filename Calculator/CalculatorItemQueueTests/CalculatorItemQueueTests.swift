//
//  CalculatorItemQueueTests.swift
//  Created by 미니.
//

import XCTest
@testable import Calculator

class CalculatorItemQueueTests: XCTestCase {
    var sut: CalculatorItemQueue<Double>!
    
    override func setUpWithError() throws {
        try super.setUpWithError()
        sut = CalculatorItemQueue()
    }
    
    override func tearDownWithError() throws {
        try super.tearDownWithError()
        sut = nil
    }
    
    func test_init을통해서_값을_넣을수있는가() {
        let queue = CalculatorItemQueue([1,2,3])
        let result = queue.isEmpty
        XCTAssertFalse(result)
    }
    
    func test_값을넣으면_isEmpty가_false인가() {
        let randomNumber = Double.random(in: 1...100)
        sut.enqueue(randomNumber)
        XCTAssertFalse(sut.isEmpty)
    }
    
    func test_값을넣지않으면_값이없는가() {
        XCTAssertTrue(sut.isEmpty)
    }
    
    func test_값을1개넣으면_front의값과동일한가() {
        let randomNumber = Double.random(in: 1...100)
        sut.enqueue(randomNumber)
        let result = sut.front
        XCTAssertEqual(result, randomNumber)
    }
    
    func test_값을여러개넣은후_front의_값이_처음들어간_값인가() {
        let count: Int = Int.random(in: 1...9)
        
        for value in 1...count {
            sut.enqueue(Double(value))
        }
        
        let result = sut.front
        XCTAssertEqual(result, 1)
    }
    
    func test_n번의_enqueue와_n_minus_1_dequeue를_수행후_front값이_예상값과동일한가() {
        let count: Int = Int.random(in: 1...9)
        let removeCount = count - 1

        for value in 0...count {
            let inputValue: Double = Double((2 * value) + 1)
            sut.enqueue(inputValue)
        }
        
        for _ in 0...removeCount {
            sut.dequeue()
        }
        
        let result = sut.front
        
        XCTAssertEqual(result, 11)
    }
    
    func test_n번의_enqueue와_m번의_dequeue를_수행후_front값이_예상값과동일한가() {
        let count: Int = 5
        let removeCount: Int = Int.random(in: 1...count)
        
        for value in 0...count {
            let inputValue: Double = Double((2 * value) + 1)
            sut.enqueue(inputValue)
        }
        
        for _ in 1...removeCount {
            sut.dequeue()
        }
        
        let result = sut.front
        let targetNumber = Double(2 * count + 1)
        XCTAssertEqual(result, targetNumber)
    }
    
    func test_n번의_enqueue와_n번의_dequeue를_수행후_front값이_nil인지() {
        let count: Int = Int.random(in: 1...9)
        
        for value in 0...count {
            let inputValue: Double = Double((2 * value) + 1)
            sut.enqueue(inputValue)
        }
        
        for _ in 0...count {
            sut.dequeue()
        }
        
        let result = sut.front
        
        XCTAssertNil(result)
    }
    
    func test_n번의_enque를_한후_마지막의값이_마지막에_위치하는가() {
        let count: Int = Int.random(in: 1...9)

        for index in 1...count {
            sut.enqueue(Double(index))
        }
        
        let result = sut.peek(count - 1)
        
        XCTAssertEqual(result, 3)
    }
    
    func test_값을_넣는_횟수와_추출하는_횟수가_같으면_배열이_비어있는가() {
        let count: Int = Int.random(in: 1...9)
        
        for value in 1...count {
            sut.enqueue(Double(value))
        }
        
        for _ in 1...count {
            sut.dequeue()
        }
        
        XCTAssertTrue(sut.isEmpty)
    }
}
