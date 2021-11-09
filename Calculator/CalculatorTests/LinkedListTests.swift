//
//  LinkedListTests.swift
//  CalculatorTests
//
//  Created by Eunsoo KIM on 2021/11/09.
//

import XCTest

class LinkedListTests: XCTestCase {

    func test_리스트에_노드_추가가_되는가() {
        let linkedList: LinkedList = LinkedList<Double>()
        
        linkedList.append(1.0)
        
        XCTAssertEqual(1.0, linkedList.first?.value)
    }
        
    func test_리스트_삭제시_head만_삭제되고_next가_head가_되는가() {
        let linkedList: LinkedList = LinkedList<Double>()
        
        linkedList.append(1.0)
        linkedList.append(2.0)
        
        linkedList.removeFirst()
        
        XCTAssertEqual(2.0, linkedList.first!.value)
    }
        
    func test_빈_리스트인지_확인이_되는가() {
        let linkedList: LinkedList = LinkedList<Double>()
        XCTAssertEqual(true, linkedList.isEmpty)
        
        linkedList.append(1.0)
        
        linkedList.removeFirst()
        
        XCTAssertEqual(true, linkedList.isEmpty)
    }
}
