//
//  CalculatorItemQueueTests.swift
//  CalculatorItemQueueTests
//
//  Created by Minseong Kang on 2023/05/30.
//

import XCTest
@testable import Calculator

final class CalculatorItemQueueTests: XCTestCase {
	var sut: MockCalculatorItemQueue<Double>!
	let mockLinkedList = MockLinkedList<Double>()
	
	override func setUpWithError() throws {
		try super.setUpWithError()
		sut = MockCalculatorItemQueue(dummyList: mockLinkedList)
	}
	
	override func tearDownWithError() throws {
		try super.tearDownWithError()
		sut = nil
	}
	
	func tests_Mock_enqueue_호출시_dummyList에_데이터가_쌓인다() {
		// given
		sut.enqueue(1.0)
		sut.enqueue(2.0)
		sut.enqueue(3.0)
		guard let input = sut.mockList?.tail?.value else { return }
		// when
		let result = 3.0
		
		// then
		XCTAssertEqual(input, result)
	}
	
	func tests_MockNode의_value값이_비교가_가능하다() {
		// given
		let input = DummyNode(value: 1)
		
		// when
		let result = DummyNode(value: 2)
		
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
		guard let result = sut.mockList?.head?.value else { return }
		
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
		sut.enqueue(3.0)
		guard let input = sut.front else { return }
		
		// when
		let result = 3.0
		
		// then
		XCTAssertEqual(input, result)
	}
	
	func tests_Mock_front_호출시_dummyList_head에_데이터가_없을경우_nil을_반환한다() {
		// given
		let input = sut.front
		
		// then
		XCTAssertNil(input)
	}
	
	func tests_Mock_calculate의_add호출시_두값이_더해서_반환된다() {
		// given
		sut.enqueue(1.0)
		sut.enqueue(2.0)
		guard let lhsInput = sut.dequeue() else { return }
		guard let rhsInput = sut.dequeue() else { return }
		let input = MockOperator.add.calculate(lhs: lhsInput, rhs: rhsInput)
		
		// when
		let result = 3.0
		
		// then
		XCTAssertEqual(input, result)
	}
	
	func tests_Mock_calculate의_subtract호출시_두값이_빼기_연산이되어_그결과값을_반환한다() {
		//given
		sut.enqueue(3.0)
		sut.enqueue(1.0)
		guard let lhsInput = sut.dequeue() else { return }
		guard let rhsInput = sut.dequeue() else { return }
		let input = MockOperator.subtract.calculate(lhs: lhsInput, rhs: rhsInput)
		
		// when
		let result = 2.0
		
		// then
		XCTAssertEqual(input, result)
	}
	
	func tests_Mock_calculte의_divide호출시_두값이_나누기_연산이되어_그결과값을_반환한다() {
		// given
		sut.enqueue(4.0)
		sut.enqueue(2.0)
		guard let lhsInput = sut.dequeue() else { return }
		guard let rhsInput = sut.dequeue() else { return }
		let input = MockOperator.divide.calculate(lhs: lhsInput, rhs: rhsInput)
		
		// when
		let result = 2.0
		
		// then
		XCTAssertEqual(input, result)
	}
}
