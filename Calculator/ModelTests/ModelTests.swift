//
//  ModelTests.swift
//  ModelTests
//
//  Created by Red on 2022/03/15.
//

import XCTest
@testable import Calculator

class ModelTests: XCTestCase {
    var sut: Queue!
    override func setUpWithError() throws {
        sut = Queue()
    }

    override func tearDownWithError() throws {
        sut = nil
    }
    
    func test_숫자파라미터가_잘_들어가는가() {
        // given
        let numberValue: Double = 10
        // when
        sut.enqueue(with: numberValue)
        guard let result = sut.queue[sut.head] as? Double else { return }
        // then
        XCTAssertEqual(result, numberValue)
    }
    
    func test_연산자파라미터가_잘_들어가는가() {
        // given
        let operatorValue: Operator = .add
        // when
        sut.enqueue(with: operatorValue)
        guard let result = sut.queue[sut.tail] as? Operator else { return }
        // then
        XCTAssertEqual(result, operatorValue)
    }
    
    func test_dequeue메서드의_Double타입을_빼낼때_잘_작동하는가() {
        // when
        sut.enqueue(with: 1.0)
        sut.enqueue(with: Operator.add)
        sut.enqueue(with: 2.0)
        guard let result = sut.dequeue() as? Double else { return }
        // then
        XCTAssertEqual(result, 1.0)
    }
    
    func test_dequeue메서드의_Operator타입을_빼낼때_잘_작동하는가() {
        // when
        sut.enqueue(with: 1.0)
        sut.enqueue(with: Operator.add)
        sut.enqueue(with: 2.0)
        _ = sut.dequeue()
        guard let result = sut.dequeue() as? Operator else { return }
        // then
        XCTAssertEqual(result, Operator.add)
    }
    
    func test_queue가_비어있을때_dequeue가_nil을뱉는지() {
        let result = sut.dequeue()
        XCTAssertNil(result)
    }
}
