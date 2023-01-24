//  NodeTest.swift
//  Created by 레옹아범 on 2023/01/24.

import XCTest
@testable import Calculator

final class NodeTest: XCTestCase {

    var sut: Node?
    
    override func setUpWithError() throws {
        sut = Node(value: "123456")
    }

    override func tearDownWithError() throws {
        sut = nil
    }
    
    func test_Node가_생성되면_prev와_next가_nil이며_value는_초기값이다() {
        let value = "123456"
        
        XCTAssertTrue(sut?.prev == nil)
        XCTAssertTrue(sut?.next == nil)
        XCTAssertEqual(value, sut?.value)
    }
    
    func test_Node의_value의_값을_바꿀수있다() {
        let value = "+ 123456"
        
        sut?.value = "+ " + (sut?.value)!
        
        XCTAssertEqual(value, sut?.value)
    }
}
