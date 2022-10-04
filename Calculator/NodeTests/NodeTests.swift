//
//  NodeTests.swift
//  NodeTests
//
//  Created by Ayaan on 2022/09/19.
//

import XCTest

class NodeTests: XCTestCase {

    func testNode_주어진_String_Type_test를_Node의_data의_초기값으로_Node를_생성한_경우_생성된_Node의_data는_String_Type_test와_값다() {
        //given
        let input = "test"
        
        //when
        let node: Node<String> = Node<String>(data: input)
        
        //then
        XCTAssertEqual(input, node.data)
    }
    
    func testNode_주어진_두개의_String_Type_first_second를_Node의_data의_초기값으로_Node_Type인_firstNode와_secondNode를_생성한_후_firstNodeNode의_next를_secondNode로_지정한_경우_firstNode의_next_data는_secondNode의_data와_같다() {
        //given
        let input = ["first", "second"]
        
        //when
        let firstNode: Node<String> = Node<String>(data: input[0])
        let secondNode: Node<String> = Node<String>(data: input[1])
        
        firstNode.next = secondNode
        
        //then
        XCTAssertEqual(firstNode.next?.data, secondNode.data)
    }
}
