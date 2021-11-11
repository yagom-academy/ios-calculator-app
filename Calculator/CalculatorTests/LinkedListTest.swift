//
//  CalculatorTests.swift
//  CalculatorTests
//
//  Created by 이차민 on 2021/11/08.
//

import XCTest

class LinkedListTest: XCTestCase {
    func test_링크드리스트에_두_개의_데이터를_추가한_이후_첫_번째_노드의_값이_잘_반환되는지() {
        let list = LinkedList<Double>()
        list.appendNode(value: 3.0)
        list.appendNode(value: 4.0)
        XCTAssertEqual(3, list.first?.value)
    }

    func test_링크드리스트에_두_개의_데이터를_추가한_이후_마지막_노드의_값이_잘_반환되는지() {
        let list = LinkedList<Double>()
        list.appendNode(value: 3.0)
        list.appendNode(value: 4.0)
        XCTAssertEqual(4, list.last?.value)
    }

    func test_링크드리스트에서_첫_번째의_노드가_다음_노드와_잘_연결되었는지() {
        let list = LinkedList<Double>()
        list.appendNode(value: 3.0)
        list.appendNode(value: 4.0)
        XCTAssertEqual(4, list.first?.next?.value)
    }

    func test_링크드리스트가_비어있는지() {
        let list = LinkedList<Double>()
        list.appendNode(value: 3.0)
        list.appendNode(value: 4.0)
        let isEmpty = list.isEmpty
        XCTAssertEqual(false, isEmpty)
    }
    
    func test_링크드리스트가_비어있는_경우에_데이터를_추출하면_nil이_나오는지() {
        let list = LinkedList<Double>()
        let isEmpty = list.isEmpty
        XCTAssertEqual(true, isEmpty)
        XCTAssertNil(list.first?.value)
    }

    func test_링크드리스트에_데이터를_추가한_후_개수가_맞는지() {
        let list = LinkedList<Double>()
        list.appendNode(value: 3.0)
        list.appendNode(value: 4.0)
        XCTAssertEqual(2, list.count)
    }

    func test_비어있는_링크드리스트에서_첫_번째_노드를_제거하는_경우_nil이_나오는지() {
        let list = LinkedList<Double>()
        let result = list.removeFirstNode()
        XCTAssertNil(result)
    }

    func test_비어있지_않은_링크드리스트에서_첫_번째_노드를_제거하는_경우_다음_노드가_첫_번째_노드가_되는지() {
        let list = LinkedList<Double>()
        list.appendNode(value: 3.0)
        list.appendNode(value: 4.0)
        list.removeFirstNode()
        XCTAssertEqual(4, list.first?.value)
    }

    func test_링크드리스트의_모든_노드들을_삭제한_후_개수가_맞는지() {
        let list = LinkedList<Double>()
        list.appendNode(value: 3.0)
        list.appendNode(value: 4.0)
        list.removeAllNodes()
        XCTAssertEqual(0, list.count)
    }
}
