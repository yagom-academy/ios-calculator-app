//
//  CalculatorTests.swift
//  CalculatorTests
//
//  Created by SeoDongyeon on 2022/03/14.
//

import XCTest
@testable import Calculator

class CalculatorTests: XCTestCase {
    var sut1: CalculatorItemQueue<String>!
    var sut2: String!

    override func setUpWithError() throws {
        try super.setUpWithError()
        sut1 = CalculatorItemQueue<String>()
    }

    override func tearDownWithError() throws {
        try super.tearDownWithError()
        sut1 = nil
    }
    
    func test_큐에값1개enqueue후count호출시출력_1() {
        sut1.enqueue("+")
        
        let result = sut1.count
        
        XCTAssertEqual(result, 1)
    }
    
    func test_값1개enqueue후dequeue후count호출시출력_0() {
        sut1.enqueue("+")
        _ = sut1.dequeue()

        let result = sut1.count
        
        XCTAssertEqual(result, 0)
    }
    
    func test_값1개enqueue후dequeue후isEmpty출력_true() {
        sut1.enqueue("+")
        _ = sut1.dequeue()
        
        let result = sut1.isEmpty
        
        XCTAssertTrue(result)
    }
    
    func test_값5개enqueue후removeAll호출시count출력_0_isEmpty호출시출력_true() {
        sut1.enqueue("+")
        sut1.enqueue("-")
        sut1.removeAll()
        
        let result = sut1.count
        let isEmpty = sut1.isEmpty
        
        XCTAssertEqual(result, 0)
        XCTAssertTrue(isEmpty)
    }
    
    func test_값5개enqueue후count호출시출력_5() {
        sut1.enqueue("+")
        sut1.enqueue("-")
        sut1.enqueue("-")
        sut1.enqueue("+")
        sut1.enqueue("-")
        
        let result = sut1.count
        
        XCTAssertEqual(result, 5)
    }
    
    func test_값5개enqueue후dequeue호출시count출력_4() {
        sut1.enqueue("+")
        sut1.enqueue("-")
        sut1.enqueue("+")
        sut1.enqueue("-")
        sut1.enqueue("+")
        _ = sut1.dequeue()
        
        let result = sut1.count
        
        XCTAssertEqual(result, 4)
    }
    
    func test_값이없는데dequeue호출시출력_nil() {
        let result = sut1.dequeue()
        
        XCTAssertNil(result)
    }
}


