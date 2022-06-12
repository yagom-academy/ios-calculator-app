//
//  NodeTests.swift
//  NodeTests
//
//  Created by Minseong Kang on 2022/05/22.
//

import XCTest
@testable import Calculator

class NodeTests: XCTestCase {
    
    // MARK: - Properties
    
    var sut: Node<Double>!

    // MARK: - Action
    
    override func setUpWithError() throws {
        sut = Node(1)
    }

    override func tearDownWithError() throws {
        sut = nil
    }
    
    func test_data에_값_할당_가능하면_True() {
        // given
        let value = 1.0
        
        // when
        sut.data = value
        
        // then
        XCTAssertEqual(sut.data, value)
    }
}
