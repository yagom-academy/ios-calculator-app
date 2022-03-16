//
//  CalculatorTests.swift
//  CalculatorTests
//
//  Created by SeoDongyeon on 2022/03/14.
//

import XCTest
@testable import Calculator

class CalculatorTests: XCTestCase {
    var sut: CalculatorItemQueue<String>!

    override func setUpWithError() throws {
        try super.setUpWithError()
        sut = CalculatorItemQueue<String>()
    }

    override func tearDownWithError() throws {
        try super.tearDownWithError()
        sut = nil
    }
    
    func test_큐에값1개enqueue후count호출시출력_1() {
        sut.enqueue("+")
        
        let result = sut.count
        
        XCTAssertEqual(result, 1)
    }
    
    func test_값1개enqueue후dequeue후count호출시출력_0() {
        sut.enqueue("+")
        sut.dequeue()
        
        let result = sut.count
        
        XCTAssertEqual(result, 0)
    }
    
    func test_값1개enqueue후dequeue후isEmpty출력_true() {
        sut.enqueue("+")
        sut.dequeue()
        
        let result = sut.isEmpty
        
        XCTAssertTrue(result)
    }
    
    func test_값5개enqueue후removeAll호출시count출력_0_isEmpty호출시출력_true() {
        sut.enqueue("+")
        sut.enqueue("-")
        sut.removeAll()
        
        let result = sut.count
        let isEmpty = sut.isEmpty
        
        XCTAssertEqual(result, 0)
        XCTAssertTrue(isEmpty)
    }
    
    func test_값5개enqueue후count호출시출력_5() {
        sut.enqueue("+")
        sut.enqueue("-")
        sut.enqueue("-")
        sut.enqueue("+")
        sut.enqueue("-")
        
        let result = sut.count
        
        XCTAssertEqual(result, 5)
    }
    
    func test_값5개enqueue후dequeue호출시count출력_4() {
        sut.enqueue("+")
        sut.enqueue("-")
        sut.enqueue("+")
        sut.enqueue("-")
        sut.enqueue("+")
        sut.dequeue()
        
        let result = sut.count
        
        XCTAssertEqual(result, 4)
    }
    
    func test_값이없는데dequeue호출시출력_nil() {
        let result = sut.dequeue()
        
        XCTAssertNil(result)
    }
}


