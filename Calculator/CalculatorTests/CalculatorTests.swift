//  CalculatorTests.swift
//  CalculatorTests
//  Created by LIMGAUI on 2022/03/15

import XCTest
@testable import Calculator

final class CalculatorTests: XCTestCase {
    var sut: LinkedList!
    override func setUpWithError() throws {
        try super.setUpWithError()
        sut = LinkedList()
    }
    override func tearDownWithError() throws {
        try super.tearDownWithError()
        sut = nil
    }
    
    func test_nodeInitializer_isSuccess() {
        let nodes = Node(data: nil, next: nil)
        
        let result = LinkedList()
        
        XCTAssertEqual(result.head?.data, nodes.data)
    }
    
    func test_LinkedList인스턴스가nil일때_count0이나오는지() {
        sut.head = nil
        
        let result = sut.count
        
        XCTAssertEqual(result, 0)
    }
    
    func test_LinkedList인스턴스가값이있을떄_count1이나오는지() {
        sut.head = Node(data: 1, next: nil)
        
        let result = sut.count
        
        XCTAssertEqual(result, 1)
    }
    
    func test_LinkedList인스턴스가data와next까지값가지고있을때_count2가나오는지() {
        sut.head = Node(data: 1, next: Node(data: 1, next: nil))
        
        let result = sut.count
        
        XCTAssertEqual(result, 2)
    }
    
    func test_LinkedList인스턴스Node길이가10일때_count10이나오는지() {
        sut.head = Node(data: 1, next: Node(data: 2, next: Node(data: 3, next: Node(data: 4, next: Node(data: 5, next: Node(data: 6, next: Node(data: 7, next: Node(data: 8, next: Node(data: 9, next: Node(data: 10, next: nil))))))))))
        
        let result = sut.count
        
        XCTAssertEqual(result, 10)
    }
    
    func test_head가nil떄_findNode메서드호출시_값이nil이나오는지() {
        sut.head = nil
        
        let result = sut.findNode(at: 0)
        
        XCTAssertEqual(result, nil)
    }
    
    func test_head값이있을때_findNode메서드호출시_head의값을똑같이반환하는지() {
        sut.head = Node(data: 1, next: nil)
        
        let result = sut.findNode(at: 1)?.data
        
        XCTAssertEqual(result, sut.head?.data)
    }
    
    func test_Node의값들이_count10일때_findNode메서드호출이_10번쨰의값이호출되는지() {
        sut.head = Node(data: 1, next: Node(data: 2, next: Node(data: 3, next: Node(data: 4, next: Node(data: 5, next: Node(data: 6, next: Node(data: 7, next: Node(data: 8, next: Node(data: 9, next: Node(data: 10, next: nil))))))))))
        
        let result = sut.findNode(at: 10)
        
        XCTAssertEqual(result, sut.head?.next?.next?.next?.next?.next?.next?.next?.next?.next)
    }
    
    func test_append메서드2번호출시_이전과다음node가_연결이되는지여부() {
        sut.append(Node(data: 1, next: nil))
        sut.append(Node(data: 2, next: nil))
        
        let result = sut.findNode(at: 1)?.next?.data
        
        XCTAssertEqual(result, 2)
    }
    
    func test_append메서드10번호출시_count10이_나오는지여부() {
        sut.append(Node(data: 1, next: nil))
        sut.append(Node(data: 2, next: nil))
        sut.append(Node(data: 3, next: nil))
        sut.append(Node(data: 4, next: nil))
        sut.append(Node(data: 5, next: nil))
        sut.append(Node(data: 6, next: nil))
        sut.append(Node(data: 7, next: nil))
        sut.append(Node(data: 8, next: nil))
        sut.append(Node(data: 9, next: nil))
        sut.append(Node(data: 10, next: nil))
        
        let result = sut.count
        
        XCTAssertEqual(result, 10)
    }
    
    func test_head가nil일때_insert메서드at1로_insert한값으로나오는지() {
        sut.head = nil
        
        sut.insert(Node(data: 3, next: nil), at: 1)
        
        XCTAssertEqual(sut.findNode(at: 1)?.data, 3)
    }
    
    func test_append메서드3번호출후_insert메서드at4호출시_값4가_잘나오는지() {
        sut.append(Node(data: 1, next: nil))
        sut.append(Node(data: 2, next: nil))
        sut.append(Node(data: 3, next: nil))
        
        sut.insert(Node(data: 4, next: nil), at: 4)
        
        XCTAssertEqual(sut.findNode(at: 4)?.data, 4)
    }
    
    func test_insert10번호출시_정상적인count10이나오는지() {
        for number in 1...10 {
            sut.insert(Node(data: number, next: nil), at: number)
        }
        XCTAssertEqual(sut.count, 10)
    }
}
