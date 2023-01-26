//  NodeTest.swift
//  Created by 레옹아범 on 2023/01/24.

import XCTest
@testable import Calculator

final class NodeTest: XCTestCase {

    var sut: Node<String>!
    
    override func setUpWithError() throws {
        sut = Node(value: "")
    }

    override func tearDownWithError() throws {
        sut = nil
    }
    
    func test_123값을_가진_Node에_추가문자열_0을_맨앞에_넣을시_0123으로_값이_바뀐다() {
        // given
        let initValue = "123"
        let exception = "0123"
        sut.value = initValue
        // when
        sut.value = "0" + sut.value
        // then
        XCTAssertEqual(exception, sut?.value)
    }
}
