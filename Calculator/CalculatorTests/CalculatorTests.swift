//
//  CalculatorTests.swift
//  CalculatorTests
//
//  Created by Serena on 2023/05/29.
//

import XCTest
@testable import Calculator

final class CalculatorTests: XCTestCase {
    var sut: CalculatorItemQueue!

    override func setUpWithError() throws {
        try super.setUpWithError()
        sut = CalculatorItemQueue()
    }

    override func tearDownWithError() throws {
        try super.tearDownWithError()
        sut = nil
    }
    
    func test_1을_queue에_넣으면_queue에_1이_있는지_확인() {
        let input: Int = 1
        let expectedResult = [1]
        
        sut.enqueue(element: input)
        let result = sut.queue as! [Int]
        
        XCTAssertEqual(expectedResult, result)
    }
    
    func test_String을_queue에_넣으면_queue에_String이_있는지_확인() {
        let input: String = "+"
        let expectedResult = ["+"]
        
        sut.enqueue(element: input)
        let result = sut.queue as! [String]
        
        XCTAssertEqual(expectedResult, result)
    }

    func test_Double타입을_queue에_넣으면_queue에_Double이_있는지_확인() {
        let input: Double = 1.0
        let expectedResult = [1.0]
        
        sut.enqueue(element: input)
        let result = sut.queue as! [Double]
        
        XCTAssertEqual(expectedResult, result)
    }
    
    func test_queue배열이_비어있을때_true를_반환하는지_확인() {
        let input = CalculatorItemQueue(queue: [])
        
        let result =  input.isEmpty
        
        XCTAssertTrue(result)
    }
    
    func test_queue배열에서_삭제시키고자하는_값을_peek에_반환하는지_확인() {
        let input = CalculatorItemQueue(queue: [1, 2, 3])
        let expectedPeek = input.queue.first as! Int
        
        let result = input.peek as! Int
        
        XCTAssertEqual(expectedPeek, result)
    }
    
    func test_reversedQueue배열이_비어있을_때_queue배열을_뒤집어서_넣는지_확인(){
        let input = CalculatorItemQueue(queue: ["다", "나", "가"], reversedQueue: [])
        let expectedResult = ["가", "나", "다"]
        
        let result = input.dequeue as! [String]
        
        XCTAssertEqual(expectedResult, result)
    }
}
