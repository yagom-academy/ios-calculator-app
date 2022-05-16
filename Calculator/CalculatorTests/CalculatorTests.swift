//
//  CalculatorTests.swift
//  CalculatorTests
//
//  Created by 이은찬 on 2022/05/16.
//

import XCTest
@testable import Calculator


class CalculatorTests: XCTestCase {
    var sut: CalculatorItemQueue!
    
    override func setUpWithError() throws {
        try super.setUpWithError()
        sut = CalculatorItemQueue()
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
    
    func test_dequeue했을경우값확인() {
        sut.enqueue(1)
        sut.enqueue(2)
        sut.enqueue(3)
        let result = sut.dequeue()
        XCTAssertEqual(result!, 1)
    }
    
    func test_clear한후에_isEmpty() {
        sut.enqueue(1)
        sut.enqueue(2)
        sut.enqueue(3)
        sut.clear()
        let result = sut.isEmpty
        XCTAssertTrue(result)
    }
}
