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

    override func setUpWithError() throws {
        try super.setUpWithError()
        sut = CalculatorLinkedList<Any>()
    }

    override func tearDownWithError() throws {
        try super.tearDownWithError()
        sut = nil
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
        sut.removeFirst()
        
        let result = sut.count
        
        XCTAssertEqual(result, 0)
    }
}
