//
//  NodeTests.swift
//  CalculatorTests
//
//  Created by JeongTaek Han on 2021/11/11.
//

import XCTest

class NodeTests: XCTestCase {

    func test_Node에Double타입_3을넣으면_item으로3을반환하는가() {
        // given
        var node: Node<Double>?
        // when
        node = Node<Double>(3.0)
        // then
        XCTAssertTrue(node?.item == Double(3.0))
    }

}
