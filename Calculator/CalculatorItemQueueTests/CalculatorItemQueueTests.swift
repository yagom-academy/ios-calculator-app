//
//  CalculatorItemQueueTests.swift
//  CalculatorItemQueueTests
//
//  Created by Minseong Kang on 2023/05/30.
//

import XCTest
@testable import Calculator

final class CalculatorItemQueueTests: XCTestCase {
	var sut: MockCalculatorItemQueue<Int>!
	let dummyLinkedList = DummyLinkedList<Int>()
	
	override func setUpWithError() throws {
		try super.setUpWithError()
		sut = MockCalculatorItemQueue(dummyList: dummyLinkedList)
	}
	
	override func tearDownWithError() throws {
		try super.tearDownWithError()
		sut = nil
	}
	
	func tests_Mock_enqueue_호출시_dummyList에_데이터가_쌓인다() {
		// given
		sut.enqueue(1)
		sut.enqueue(2)
		sut.enqueue(3)
		let input = dummyLinkedList
		let expection = MockCalculatorItemQueue(dummyList: dummyLinkedList)
		// when
		let resultDummyLinkedList = DummyLinkedList<Int>()
		let result = MockCalculatorItemQueue(dummyList: resultDummyLinkedList)
		result.enqueue(1)
		result.enqueue(2)
		result.enqueue(3)
		// then
		XCTAssertEqual(expection, result)
	}
}
