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
		var input = sut.getElementsForTest()
		
		// when
		let result = [1]
		
		// then
		XCTAssertEqual(input, result)
	}
}
