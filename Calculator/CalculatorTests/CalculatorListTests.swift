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
    
// MARK: - CalculatorList.append
    func test_리스트에_값이없을경우_삽입값은_tail() {
        //given
        let inputNode = Node<String>(value: "123")
        
        //when
        sut.append(inputNode)
        
        //then
        XCTAssertEqual(sut.tail?.value, sut.head?.value)
    }
    
    func test_리스트에_값_삽입() {
        //given
        let firstNode = Node<String>(value: "node1 Value")
        let secondNode = Node<String>(value: "node2 Value")
        
        //when
        sut.append(firstNode)
        sut.append(secondNode)
        
        //then
        XCTAssertEqual(sut.size(), 2)
        XCTAssertEqual(sut.head?.value, firstNode.value)
        XCTAssertEqual(sut.tail?.value, secondNode.value)
                                      
    }
    
// MARK: - CalculatorList.isEmpty
    func test_요소가없으면_true() {
        //when
        let result = sut.isEmpty()
        
        //then
        XCTAssertEqual(result, true)
    }
    
    func test_요소가있으면_false() {
        //given
        let insertNode = Node<String>(value: "asd")
        sut.append(insertNode)
        
        //when
        let result = sut.isEmpty()
        
        //then
        XCTAssertEqual(result, false)
    }

// MARK: - CalculatorList.removeAll()
    func test_removeAll시_head및tail은_nil() {
        //given
        let insertNode = Node<String>(value: "asd")
        sut.append(insertNode)
        
        //when
        sut.removeAll()
        
        //then
        XCTAssertNil(sut.head)
        XCTAssertNil(sut.tail)
    }
    
// MARK: - CalculatorList.pop()
    func test_노드가3개이상일때_popLast하면_tail의value() {
        //given
        let insertNode1 = Node<String>(value: "asd")
        let insertNode2 = Node<String>(value: "qwe")
        let insertNode3 = Node<String>(value: "zxc")
        let insertNode4 = Node<String>(value: "rty")
        sut.append(insertNode1)
        sut.append(insertNode2)
        sut.append(insertNode3)
        sut.append(insertNode4)

        //when
        let result = sut.pop()
        
        //then
        XCTAssertEqual(result?.value, insertNode1.value)
        XCTAssertEqual(sut.head?.value, insertNode2.value)

    }
    
    func test_노드가한개일때_pop하면_Node반환후_head및tail_nil() {
        //given
        let insertNode = Node<String>(value: "asd")
        sut.append(insertNode)
        
        //when
        let result = sut.pop()
        
        //then
        XCTAssertEqual(result?.value, insertNode.value)
        XCTAssertNil(sut.head)
        XCTAssertNil(sut.tail)
    }
    
    func test_노드가없을때_popLast하면_nil() {
        //when
        let result = sut.pop()
        
        //then
        XCTAssertNil(result)
    }
}
