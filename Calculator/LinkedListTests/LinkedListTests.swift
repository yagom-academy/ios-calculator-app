//
//  LinkedListTests.swift
//  LinkedListTests
//
//  Created by hoon, hemg on 2023/05/31.
//

import XCTest
@testable import Calculator

final class LinkedListTests: XCTestCase {
    var sut: LinkedList<Int>!

    override func setUpWithError() throws {
        try super.setUpWithError()
        sut = LinkedList()
    }

    override func tearDownWithError() throws {
        try super.tearDownWithError()
        sut = nil
    }
    
    func test_append_data로0을입력하면_first를통해_입력받은data인0을반환한다() {
        // given
        let expectedData: Int = 0
        
        // when
        sut.append(expectedData)
        let result = sut.first
        
        // then
        XCTAssertTrue(result == expectedData)
    }
    
    func test_append_두data를입력을받으면_last를통해_마지막입력데이터를반환한다() {
        // given
        let firstNodeData: Int = 0
        let secondNodeData: Int = 1
        
        // when
        sut.append(firstNodeData)
        sut.append(secondNodeData)
        
        // then
        XCTAssertEqual(sut.last, secondNodeData)
    }
    
    func test_append_3개의data를_입력으로3개의Node를만들고_last로마지막노드의data를반환한다() {
        // given
        let firstNodeData: Int = 0
        let secondNodeData: Int = 1
        let thirdNodeData: Int = 2
        
        // when
        sut.append(firstNodeData)
        sut.append(secondNodeData)
        sut.append(thirdNodeData)
        
        // then
        XCTAssertEqual(sut.last, thirdNodeData)
    }
    
    func test_removeFirst_3개의data를입력받아_Node를추가하고_제거한Node의data를반환한다() {
        // given
        let firstNodeData: Int = 0
        let secondNodeData: Int = 1
        let thirdNodeData: Int = 2
        
        // when
        sut.append(firstNodeData)
        sut.append(secondNodeData)
        sut.append(thirdNodeData)
        
        guard let firstData: Int = sut.removeFirst() else { return }
        guard let secondData: Int = sut.removeFirst() else { return }
        guard let thirdData: Int = sut.removeFirst() else { return }
        
        // then
        XCTAssertEqual(firstData, firstNodeData)
        XCTAssertEqual(secondData, secondNodeData)
        XCTAssertEqual(thirdData, thirdNodeData)
    }
    
    func test_removeFirst_LinkedList가비었을때_data를빼려고하면_nil을반환한다() {
        // given
        sut = LinkedList()
        
        // when
        let result: Int? = sut.removeFirst()
        
        // then
        XCTAssertNil(result)
    }
}
