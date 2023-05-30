//
//  CalculatorNodeTests.swift
//  CalculatorNodeTests
//
//  Created by Minseong Kang on 2023/05/30.
//

import XCTest
@testable import Calculator

final class CalculatorNodeTests: XCTestCase {
	var sut: Node<Any>!
	
    override func setUpWithError() throws {
        try super.setUpWithError()
		sut = Node<Any>()
    }

    override func tearDownWithError() throws {
        try super.tearDownWithError()
		sut = nil
    }
	
	func tests_Node클래스의_value프로퍼티에_T타입이_들어감() {
		// given
		let testValue = Node(value: 1)
		
		// when
		let result = Node(value: 1)
		
		// then
		XCTAssertEqual(testValue, result)
	}
}
