//
//  CalculatorList.swift
//  CalculatorTests
//
//  Created by 유한석 on 2022/05/17.
//

import XCTest

class CalculatorListTests: XCTestCase {
    var sut: CalculatorList<String>!
    
    override func setUpWithError() throws {
        try super.setUpWithError()
        sut = CalculatorList()
    }

    override func tearDownWithError() throws {
        try super.tearDownWithError()
        sut = nil
    }
// MARK: - CalculatorList.size
    func test_아무것도없으면_0반환() {
        //when
        let result = sut.size()
        
        //then
        XCTAssertEqual(result, 0)
    }
    
    func test_1개있을때_1반환() {
        //given
        sut.head = Node<String>(value: "123", next: nil)
        sut.tail = sut.head
        
        //when
        let result = sut.size()
        
        //then
        XCTAssertEqual(result, 1)
    }
    
    func test_3개있을때_3반환() {
        //given
        let node1 = Node<String>(value: "123")
        let node2 = Node<String>(value: "456")
        let node3 = Node<String>(value: "789")
        node1.next = node2
        node2.next = node3
        sut.head = node1
        sut.tail = node3
        
        //when
        let result = sut.size()
        
        //then
        XCTAssertEqual(result, 3)
    }
}
