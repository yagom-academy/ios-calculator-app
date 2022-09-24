//
//  NodeTests.swift
//  NodeTests
//
//  Created by Ayaan on 2022/09/19.
//

import XCTest

class NodeTests: XCTestCase {

    func testNode_주어진_input값으로_Node를_생성한_경우_생성된_Node의_data는_input값입니다() {
        //given
        let input = "test"
        
        //when
        let node: Node<String> = Node<String>(data: input)
        
        //then
        XCTAssertEqual(input, node.data)
    }
    
    func testNode_주어진_두개의_input값으로_두개의_Node를_생성한_후_첫번째_Node의_next를_두번째_Node로_지정한_경우_첫번째_Node의_next의_data는_두번째_Node의_data와_같습니다() {
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
