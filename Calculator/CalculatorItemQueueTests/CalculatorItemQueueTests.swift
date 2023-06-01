//
//  CalculatorItemQueueTests.swift
//  CalculatorItemQueueTests
//
//  Created by Minseong Kang on 2023/05/30.
//

import XCTest
@testable import Calculator

final class CalculatorItemQueueTests: XCTestCase {
	var sut: CalculatorItemQueue<Int>!
	
	override func setUpWithError() throws {
		try super.setUpWithError()
		sut = CalculatorItemQueue()
	}
	
	override func tearDownWithError() throws {
		try super.tearDownWithError()
		sut = nil
	}
	
	func tests_enqueue함수호출시_elements배열안에_요소가_들어간다() {
		// given
		sut.enqueue(1)
		let input = sut.getElementsForTest()
		
		// when
		let result = [1]
		
		// then
		XCTAssertEqual(input, result)
	}
	
	func tests_enqueue함수를_여러번_호출시_elements배열안에_여러개의_요소가_들어간다() {
		// given
		sut.enqueue(1)
		sut.enqueue(2)
		sut.enqueue(3)
		let input = sut.getElementsForTest()
		
		// when
		let result = [1,2,3]
		
		// then
		XCTAssertEqual(input, result)
	}
	
	func tests_dequeue함수를_호출시_elements가_빈배열일경우_nil을_반환한다() {
		// given
		let input = sut.dequeue()
		// then
		XCTAssertNil(input)
	}
	
	func tests_dequeue함수를_호출시_elements내부의_요소가_하나씩_빠진다() {
		//given
		sut.enqueue(1)
		sut.enqueue(2)
		sut.enqueue(3)
		guard let input = sut.dequeue() else { return }
		
		// when
		let result = 1
		
		// then
		XCTAssertEqual(input, result)
	}
}
