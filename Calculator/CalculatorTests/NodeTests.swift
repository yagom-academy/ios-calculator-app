//
//  NodeTests.swift
//  CalculatorTests
//
//  Created by JeongTaek Han on 2021/11/11.
//

import XCTest

class NodeTests: XCTestCase {
    
    var sutDoubleNode: Node<Double>!
    var sutIntNode: Node<Int>!
    
    override func tearDownWithError() throws {
        try super.tearDownWithError()
        sutDoubleNode = nil
        sutIntNode = nil
    }

    func test_Node에_Double_타입_3을_넣으면_item으로_3을_반환하는가() {
        // given
        // when
        sutDoubleNode = Node<Double>(3.0)
        // then
        XCTAssertTrue(sutDoubleNode.item == 3.0)
    }
    
    func test_Node에_Int_타입_3을_넣으면_item으로_3을_반환하는가() {
        // given
        // when
        sutIntNode = Node<Int>(3)
        // then
        XCTAssertEqual(sutIntNode.item, 3)
    }

}
