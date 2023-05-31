//
//  CalculatorItemQueueTests.swift
//  CalculatorItemQueueTests
//
//  Created by Minseong Kang on 2023/05/30.
//

import XCTest
@testable import Calculator

final class CalculatorItemQueueTests: XCTestCase {
	var sut: CalculatorItemQueue!
	
    override func setUpWithError() throws {
		try super.setUpWithError()
		sut = CalculatorItemQueue()
    }

    override func tearDownWithError() throws {
		try super.tearDownWithError()
		sut = nil
    }
	
	func tests_배열에_값이_들어간다() {
		// given
		let input: [Int] = sut.enqueue(1)
		
		// when
		let result: [Int] = [1]
		
		// then
		XCTAssertEqual(input, result)
	}
	
	func tests_배열에서_값이_빠진다() {
		// given
		var _: [Int] = sut.enqueue(1)
		
		// when
		let result = sut.dequeue()
		
		// then
		XCTAssertEqual(result, 1)
	}
	
	func tests_peek함수를_호출시_배열의_첫번째_인덱스값을_반환한다() {
		// given
		_ = sut.enqueue(1)
		let expection = 1
		
		// when
		let result = sut.peek()
		
		// then
		XCTAssertEqual(result, expection)
	}
	
	func tests_peek함수를_호출시_배열의_요소가_여러개여도_첫번째_인덱스를_반환한다() {
		// given
		var input = sut.enqueue(1)
		input = sut.enqueue(2)
		input = sut.enqueue(3)
		let expection = 1
		
		// when
		let result = sut.peek()
		
		// then
		XCTAssertEqual(result, expection)
	}
	
	func tests_peek함수를_호출시_배열의_요소가_없을때_nil을_반환한다() {
		// given
		
		// when
		let result = sut.peek()
		
		// then
		XCTAssertNil(result)
	}
}
