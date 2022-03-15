//
//  CalculatorTests.swift
//  CalculatorTests
//
//  Created by SeoDongyeon on 2022/03/14.
//

import XCTest
@testable import Calculator

class CalculatorTests: XCTestCase {
    var sut: CalculatorLinkedList<Any>!
    var sutQ: CalculatorItemQueue<Any>!

    override func setUpWithError() throws {
        try super.setUpWithError()
        sut = CalculatorLinkedList<Any>()
        sutQ = CalculatorItemQueue<Any>()
    }

    override func tearDownWithError() throws {
        try super.tearDownWithError()
        sut = nil
        sutQ = nil
    }
    
    func test_count호출시_출력_0() {
        
        let result = sut.count
        
        XCTAssertEqual(result, 0)
    }
    
    func test_count호출시_출력_1() {
        sut.head = CalculatorNode(value: 10)
        
        let result = sut.count
        
        XCTAssertEqual(result, 1)
    }
    
    func test_새로운node를3개append하면count호출시출력_3() {
        sut.append(10)
        sut.append(20)
        sut.append(30)
        
        let result = sut.count
        
        XCTAssertEqual(result, 3)
    }
    
    func test_새로운node를6개append후removeAll호출시출력_0() {
        sut.append(10)
        sut.append(20)
        sut.append(30)
        sut.append(10)
        sut.append(20)
        sut.append(30)
        sut.removeAll()
        
        let result = sut.count
        
        XCTAssertEqual(result, 0)
    }
    
    func test_새로운node를1개append후removeFirst호출시출력_0() {
        sut.append(10)
        sut.removeFirst()
        
        let result = sut.count
        
        XCTAssertEqual(result, 0)
    }
    
    func test_node를1개append후isEmpty호출시출력_false() {
        sut.append(10)
        
        let result = sut.isEmpty
        
        XCTAssertFalse(result)
    }
    
    func test_node를1개append후removeFirst후isEmpty호출시출력_true() {
        sut.append(10)
        sut.removeFirst()
        
        let result = sut.isEmpty
        
        XCTAssertTrue(result)
    }
    
    func test_큐에값1개enqueue후count호출시출력_1() {
        sutQ.enqueue("+")
        
        let result = sutQ.count
        
        XCTAssertEqual(result, 1)
    }
    
    func test_값1개enqueue후dequeue후count호출시출력_0() {
        sutQ.enqueue("+")
        sutQ.dequeue()
        
        let result = sutQ.count
        
        XCTAssertEqual(result, 0)
    }
    
    func test_값1개enqueue후dequeue후isEmpty출력_true() {
        sutQ.enqueue("+")
        sutQ.dequeue()
        
        let result = sutQ.isEmpty
        
        XCTAssertTrue(result)
    }
    
    func test_값5개enqueue후removeAll호출시count출력_0_isEmpty호출시출력_true() {
        sutQ.enqueue(1)
        sutQ.enqueue("+")
        sutQ.enqueue(3)
        sutQ.enqueue("-")
        sutQ.enqueue(2)
        sutQ.removeAll()
        
        let result = sutQ.count
        let isEmpty = sutQ.isEmpty
        
        XCTAssertEqual(result, 0)
        XCTAssertTrue(isEmpty)
    }
    
    func test_값5개enqueue후count호출시출력_5() {
        sutQ.enqueue(1)
        sutQ.enqueue("+")
        sutQ.enqueue(3)
        sutQ.enqueue("-")
        sutQ.enqueue(2)
        
        let result = sutQ.count
        
        XCTAssertEqual(result, 5)
    }
    
    func test_값5개enqueue후dequeue호출시count출력_4() {
        sutQ.enqueue(1)
        sutQ.enqueue("+")
        sutQ.enqueue(3)
        sutQ.enqueue("-")
        sutQ.enqueue(2)
        sutQ.dequeue()
        
        let result = sutQ.count
        
        XCTAssertEqual(result, 4)
    }
    
    func test_값이없는데dequeue호출시출력_nil() {
        let result = sutQ.dequeue()
        
        XCTAssertNil(result)
    }
}


