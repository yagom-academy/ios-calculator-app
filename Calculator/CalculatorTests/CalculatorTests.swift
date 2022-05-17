//
//  CalculatorTests.swift
//  CalculatorTests
//
//  Created by 이은찬 on 2022/05/16.
//

import XCTest
@testable import Calculator

class CalculatorTests: XCTestCase {
    var sut: CalculatorItemQueue<Int>!
    
    override func setUpWithError() throws {
        try super.setUpWithError()
        sut = CalculatorItemQueue<Int>()
    }
    
    override func tearDownWithError() throws {
        try super.tearDownWithError()
        sut = nil
    }
    
    func test_비어있을때isEmpty가트루인지확인() {
        let result = sut.isEmpty
        XCTAssertTrue(result)
    }
    
    func test_들어있을때isEmpty가거짓인지확인() {
        sut.enqueue(1)
        let result = sut.isEmpty
        XCTAssertFalse(result)
    }
    
    func test_들어있을때count값확인() {
        sut.enqueue(1)
        sut.enqueue(2)
        sut.enqueue(5)
        let result = sut.count
        XCTAssertEqual(result, 3)
    }
    
    func test_dequeue가되는지확인1() {
        sut.enqueue(1)
        sut.enqueue(2)
        sut.enqueue(3)
        sut.dequeue()
        let result = sut.count
        XCTAssertEqual(result, 2)
    }
    
    func test_dequeue가되는지확인2() {
        sut.enqueue(1)
        sut.enqueue(2)
        sut.enqueue(3)
        let result = sut.dequeue()?.value
        XCTAssertEqual(result, 1)
    }
    
    func test_isEmpty에서dequeue가되는지확인() {
        let a = sut.dequeue()?.value
        XCTAssertEqual(nil, a)
    }
    
    func test_removeAll하는지확인1() {
        sut.enqueue(1)
        sut.enqueue(2)
        sut.enqueue(3)
        sut.removeAll()
        let result = sut.count
        XCTAssertEqual(result, 0)
    }
    
    func test_removeAll하는지확인2() {
        sut.enqueue(1)
        sut.enqueue(2)
        sut.enqueue(3)
        sut.removeAll()
        let result = sut.isEmpty
        XCTAssertTrue(result)
    }
    
    func test_dequeue후append메서드사용할할경우() {
        sut.enqueue(1)
        sut.enqueue(2)
        var result = sut.firstValue
        XCTAssertEqual(result, 1)
        sut.dequeue()
        result = sut.firstValue
        XCTAssertEqual(result, 2)
        sut.dequeue()
        result = sut.firstValue
        XCTAssertEqual(result, nil)
        sut.enqueue(5)
        result = sut.firstValue
        XCTAssertEqual(result, 5)
        sut.dequeue()
        result = sut.firstValue
        XCTAssertEqual(result, nil)
        result = sut.count
        XCTAssertEqual(result, 0)
    }
}
