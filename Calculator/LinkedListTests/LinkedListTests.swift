//
//  LinkedListTests.swift
//  LinkedListTests
//
//  Created by Minseong Kang on 2022/05/22.
//

import XCTest
@testable import Calculator

class LinkedListTests: XCTestCase {
    
    // MARK: - Properties
    
    var sut: LinkedList<Double>!
    
    // MARK: - Action
    
    override func setUpWithError() throws {
        sut = LinkedList()
    }

    override func tearDownWithError() throws {
        sut = nil
    }
    
    // MARK: - append(_:)
    
    func test_append메서드_head가_nil일때_append하면_head에_값이할당된다() {
        // given
        let data = 1.0
        let newNode = Node(data)
        
        // when
        sut.append(newNode)
        
        // then
        XCTAssertEqual(newNode.data, sut.head?.data)
    }
    
    // MARK: - isEmpty()
    
    func test_isEmpty메서드_head가_nil이면_True() {
        // when
        let result = sut.isEmpty()
        
        // then
        XCTAssertTrue(result)
    }
}
