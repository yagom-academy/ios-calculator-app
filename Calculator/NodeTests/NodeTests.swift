//
//  NodeTests.swift
//  NodeTests
//
//  Created by Ayaan on 2022/09/19.
//

import XCTest

class NodeTests: XCTestCase {

    func test_input값으로_Node를_생성하면_생성된_Node의_data이랑_Input값이_같은가() {
        //given
        let input = "test"
        
        //when
        let node: Node<String> = Node<String>(data: input)
        
        //then
        XCTAssertEqual(input, node.data)
    }
    
    func test_입력된_두개의_값으로_Node를_생성하고_첫번째_Node의_next를_두번째_Node로_지정하면_첫번째_Node의_next의_data와_두번째_Node의_data가_같은가() {
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
