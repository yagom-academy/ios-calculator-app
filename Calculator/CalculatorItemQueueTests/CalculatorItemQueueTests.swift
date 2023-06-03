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
		guard let input = sut.dummyList?.tail?.value else { return }
		// when
		let result = 3
		
		// then
		XCTAssertEqual(input, result)
	}
	
	func tests_MockNode의_value값이_비교가_가능하다() {
		// given
		let input = MockNode(value: 1)
		
		// when
		let result = MockNode(value: 2)
		
		// then
		XCTAssertNotEqual(input, result)
	}
	
	func tests_Mock_dequeue_호출시_dummyList에서_데이터가_삭제된다() {
		// given
		sut.enqueue(1)
		sut.enqueue(2)
		sut.enqueue(3)
		
		// when
		_ = sut.dequeue()
		_ = sut.dequeue()
		_ = sut.dequeue()
		guard let result = sut.dummyList?.head?.value else { return }
		
		XCTAssertEqual(result, 0)
	}
	
	func tests_Mock_isEmpty_호출시_빈dummyList일경우_true가_반환된다() {
		// given
		guard let input = sut.isEmpty else { return }
		
		// when
		
		// then
		XCTAssertTrue(input)
	}
	
	func tests_Mock_isEmpty_호출시_데이터가_있는_dummyList일경우_false가_반환된다() {
		// given
		sut.enqueue(1)
		guard let input = sut.isEmpty else { return }
		
		// then
		XCTAssertFalse(input)
	}
	
	func tests_Mock_front_호출시_dummyList_head에_데이터가_있을경우_그_데이터를_가져온다() {
		// given
		sut.enqueue(3)
		guard let input = sut.front else { return }
		
		// when
		let result = 3
		
		// then
		XCTAssertEqual(input, result)
	}
}
