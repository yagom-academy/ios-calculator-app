//
//  CalculatorTests.swift
//  CalculatorTests
//
//  Created by JeongTaek Han on 2021/11/09.
//

import XCTest

class CalculatorTests: XCTestCase {

    func test_Node에Double타입_3을넣으면_item으로3을반환하는가() {
        // given
        var node: Node<Double>?
        // when
        node = Node<Double>(3.0)
        // then
        XCTAssertTrue(node?.item == Double(3.0))
    }
    
    func test_비어있는LinkedList에1을추가했을때0번인덱스에1이존재하는가() {
        // given
        let list = LinkedList<Int>()
        // when
        list.append(1)
        // then
        XCTAssertTrue(list[0] == 1)
    }
    
    func test_비어있는LinkedList의0번인덱스에접근하면nil을반환하는가() {
        // given
        let list = LinkedList<Int>()
        // when
        // emptylist
        // then
        XCTAssertTrue(list[0] == nil)
    }
    
    func test_1만들어있는list에1번인덱스에접근하면nil반환하는가() {
        // given
        let list = LinkedList<Int>()
        // when
        list.append(1)
        // then
        XCTAssertTrue(list[1] == nil)
    }
    
    func test_1_2_3이들어있는리스트에서0번인덱스를제거하면첫원소로2가되는가() {
        // given
        let list = LinkedList<Int>()
        list.append(1)
        list.append(2)
        list.append(3)
        // when
        list.remove(at: 0)
        // then
        XCTAssertEqual(list[0], 2)
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        measure {
            // Put the code you want to measure the time of here.
        }
    }

}
