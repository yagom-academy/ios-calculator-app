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
		var input: [Int] = sut.enqueue(1)
		
		// when
		let result = sut.dequeue()
		
		// then
		XCTAssertEqual(result, 1)
	}
}
