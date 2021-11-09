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
        print(list.pop())
        print(list.pop())
        XCTAssertEqual(list.head?.data, nil)
        XCTAssertEqual(list.tail?.data, nil)
    }
}
