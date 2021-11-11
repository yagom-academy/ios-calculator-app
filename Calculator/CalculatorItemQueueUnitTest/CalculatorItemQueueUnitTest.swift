//
//  CalculatorItemQueueUnitTest.swift
//  CalculatorItemQueueUnitTest
//
//  Created by si won kim on 2021/11/09.
//

import XCTest

class CalculatorItemQueueUnitTest: XCTestCase {
    var sut: CalculatorItemQueue<Character>!
    
    override func setUpWithError() throws {
        try super.setUpWithError()
        sut = CalculatorItemQueue<Character>()
    }

    override func tearDownWithError() throws {
        try super.tearDownWithError()
        sut = nil
    }

    func test_빈_큐에_1을_push하면_1이_남는다() {
        let input: Character = "1"
        sut.enqueue(input)
        
        guard let result = sut.dequeue() else { return }
        XCTAssertEqual(result, "1")
    }
    
    func test_빈_큐에_1과_2를_enqueue하면_1과_2가_남는다() {
        let firstInput: Character = "1"
        sut.enqueue(firstInput)
        let secondInput: Character = "2"
        sut.enqueue(secondInput)
        
        guard let firstResult = sut.dequeue() else { return }
        guard let secondResult = sut.dequeue() else { return }
        
        XCTAssertEqual(firstResult, "1")
        XCTAssertEqual(secondResult, "2")
    }
    
    func test_빈_큐에_더하기를_push하면_더하기가_남는다() {
        let input: Character = "+"
        sut.enqueue(input)
        guard let result = sut.dequeue() else { return }

        XCTAssertEqual(result, "+")
    }
    
    func test_1과_2와_3이_있는_큐를_pop하면_1이_나온다() {
        let firstInput: Character = "1"
        sut.enqueue(firstInput)
        let secondInput: Character = "2"
        sut.enqueue(secondInput)
        let thirdInput: Character = "3"
        sut.enqueue(thirdInput)
        
        guard let result = sut.dequeue() else { return }
        
        XCTAssertEqual(result, "1")
    }
    
    func test_빈_큐에_pop을_하면_에러가_난다() {
        let result = sut.dequeue()
        XCTAssertNil(result)
    }

    func test_1과_2가_있는_큐의_모든_요소를_제거하면_빈_큐가_된다() {
        sut.removeAll()
    }
}
