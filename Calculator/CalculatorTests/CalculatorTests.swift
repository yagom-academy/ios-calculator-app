//  CalculatorTests.swift
//  CalculatorTests
//  Created by LIMGAUI on 2022/03/15

import XCTest
@testable import Calculator

final class CalculatorTests: XCTestCase {
    var sut: LinkedList<Int>!
    override func setUpWithError() throws {
        try super.setUpWithError()
        sut = LinkedList<Int>()
    }
    override func tearDownWithError() throws {
        try super.tearDownWithError()
        sut = nil
    }
    
    func test_LinkedList인스턴스가nil일때_count0이나오는지() {
        let result = sut.count
        
        XCTAssertEqual(result, 0)
    }
    
    func test_LinkedList인스턴스Node길이가10일때_count10이나오는지() {
        for number in 1...10 {
            sut.append(data: number)
        }
        let result = sut.count
        
        XCTAssertEqual(result, 10)
    }
    
    func test_append메서드3번호출시_nodeCount값이_3이나오는지() {
        let numbers: [Int] = [1, 2, 3]
        numbers.forEach(sut.append(data:))
        let result = sut.count
        
        XCTAssertEqual(result, 3)
    }
    
    func test_append메서드10번호출후_head는1_tail은10값이나오는지() {
        for number in 1...10 {
            sut.append(data: number)
        }
        let head = sut.head?.data
        let tail = sut.tail?.data
        
        XCTAssertEqual(head, 1)
        XCTAssertEqual(tail, 10)
    }
    
    func test_removeFirst메서드호출시_값5가_나오는지() {
        sut.append(data: 5)
        
        let result = sut.removeFirst()
        
        XCTAssertEqual(result, 5)
    }
    
    func test_append메서드5번호출후_removeFirst메서드5번호출후_count값이0이나오는지() {
        for number in 1...5 {
            sut.append(data: number)
        }
        for _ in 1...5 {
            let _ = sut.removeFirst()
        }
        
        let result = sut.count
        
        XCTAssertEqual(result, 0)
    }
    
    func test_append메서드10000번호출후_removeFirst메서드9999번호출후_마지막RemoveFirst메서드호출한값이10000이_나오는지() {
        for number in 1...10000 {
            sut.append(data: number)
        }
        for _ in 1...9999 {
            let _ = sut.removeFirst()
        }
        
        let result = sut.removeFirst()
        
        XCTAssertEqual(result, 10000)
    }
}

