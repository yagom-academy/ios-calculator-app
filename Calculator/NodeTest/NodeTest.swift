//
//  NodeTest.swift
//  NodeTest
//
//  Created by 강민수 on 2023/01/24.
//

import XCTest
@testable import Calculator

final class NodeTest: XCTestCase {

    var sut: Node?
    
    override func setUpWithError() throws {
        sut = Node(value: "a")
    }

    override func tearDownWithError() throws {
        sut = nil
    }
    
    func test_Node가_생성되었는지_확인() {
        let value = "a"
        
        XCTAssertTrue(sut?.prev == nil)
        XCTAssertTrue(sut?.next == nil)
        XCTAssertEqual(value, sut?.value)
    }

}
