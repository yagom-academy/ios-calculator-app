//
//  NodeTests.swift
//  NodeTests
//
//  Created by Daehoon Lee on 2023/05/30.
//

import XCTest
@testable import Calculator

final class NodeTests: XCTestCase {
    var sut: Node!

    override func setUpWithError() throws {
        super.setUpWithError()
        sut = Node()
    }

    override func tearDownWithError() throws {
        super.tearDownWithError()
        sut = nil
    }
    
    func test_init_data초기화한다() {
        // given
        let expectedData = 0
        
        // when
        let testNode = Node(data: expectedData)
        
        // then
        XCTAssertEqual(testNode.data, expectedData)
    }
}
