//
//  CalculatorTests.swift
//  CalculatorTests
//
//  Created by JeongTaek Han on 2021/11/09.
//

import XCTest

class CalculatorTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

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
        var list = LinkedList<Int>()
        // when
        list.append(1)
        // then
        XCTAssertTrue(list[0] == 1)
    }
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        measure {
            // Put the code you want to measure the time of here.
        }
    }

}
