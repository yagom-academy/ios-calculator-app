//
//  ListTest.swift
//  CalculatorTests
//
//  Created by 이승재 on 2021/11/09.
//

import XCTest

class ListTest: XCTestCase {

    func test_emptyAfterPop() {
        var list = LinkedList<Int>()
        list.append(1)
        list.append(2)
        XCTAssertEqual(list.head?.data!, 1)
        XCTAssertEqual(list.tail?.data!, 2)
        XCTAssertEqual(list.pop()!, 1)
        XCTAssertEqual(list.head?.data!, 2)
        XCTAssertEqual(list.tail?.data!, 2)
        XCTAssertEqual(list.pop()!, 2)
        XCTAssertTrue(list.isEmpty)
        XCTAssertNil(list.head?.data!)
        XCTAssertNil(list.tail?.data!)
    }
    
    func test_emptyAfterRemoveLast() {
        var list = LinkedList<Int>()
        list.append(1)
        list.append(2)
        XCTAssertEqual(list.removeLast()!, 2)
        XCTAssertEqual(list.removeLast()!, 1)
        XCTAssertTrue(list.isEmpty)
        XCTAssertNil(list.head)
        XCTAssertNil(list.tail)
    }
    
}
