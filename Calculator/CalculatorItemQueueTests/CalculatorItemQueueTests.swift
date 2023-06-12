//
//  CalculatorItemQueueTests.swift
//  CalculatorItemQueueTests
//
//  Created by Minseong Kang on 2023/05/30.
//

import XCTest
@testable import Calculator

final class CalculatorItemQueueTests: XCTestCase {
	var sut: (any Queueable<Double>)!
	let mockLinkedList = LinkedList<Double>()
	
	var mockOperatorCalculatorItemQueue: (any Queueable<Operator>)!
	let mockOperatorLinkedList = LinkedList<Operator>()
	
	override func setUpWithError() throws {
		try super.setUpWithError()
		sut = MockCalculatorItemQueue(list: mockLinkedList)
		mockOperatorCalculatorItemQueue = MockCalculatorItemQueue(list: mockOperatorLinkedList)
	}
	
	override func tearDownWithError() throws {
		try super.tearDownWithError()
		sut = nil
		mockOperatorCalculatorItemQueue = nil
	}
	
	func tests_Mock_enqueue_호출시_dummyList에_데이터가_쌓인다() {
		// given
		sut.enqueue(1.0)
		sut.enqueue(2.0)
		sut.enqueue(3.0)
		_ = sut.dequeue()
		_ = sut.dequeue()
		guard let input = sut.dequeue() else { return }
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
		guard let result = sut.isEmpty else { return }

		// then
		XCTAssertTrue(result)
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

	func tests_MockOperator_calculate의_add호출시_두값이_더해서_반환된다() {
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

	func tests_MockOperator_calculate의_subtract호출시_두값이_빼기_연산이되어_그결과값을_반환한다() {
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

	func tests_MockOperator_calculate의_divide호출시_두값이_나누기_연산이되어_그결과값을_반환한다() {
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

	func tests_MockOperator_calculate_multiply호출시_두값이_곱하기_연산이되어_그결과값을_반환한다() {
		// given
		sut.enqueue(2.0)
		sut.enqueue(7.0)
		guard let lhsInput = sut.dequeue() else { return }
		guard let rhsInput = sut.dequeue() else { return }
		let input = MockOperator.multiply.calculate(lhs: lhsInput, rhs: rhsInput)

		// when
		let result = 14.0

		// then
		XCTAssertEqual(input, result)
	}

	func tests_MockFormula_operator에_add를_넣으면_초기값으로_할당된다() {
		// given
		sut.enqueue(1.0)
		guard let inputOperand = sut.dequeue() else { return }

		mockOperatorCalculatorItemQueue.enqueue(.add)
		guard let inputOperator = mockOperatorCalculatorItemQueue.dequeue() else { return }

		let dummyOperands: LinkedList<Double> = LinkedList<Double>()
		let operands = MockCalculatorItemQueue<Double>(list: dummyOperands)
		operands.enqueue(inputOperand)

		let dummyOperator: LinkedList<Operator> = LinkedList<Operator>()
		let `operator` = MockCalculatorItemQueue<Operator>(list: dummyOperator)
		`operator`.enqueue(inputOperator)

		// when
		let result = MockFormula(operands: operands, operators: `operator`)

		// then
		XCTAssertNotNil(result)
	}

	func tests_MockFormula_operator에_subtract를_넣으면_초기값으로_할당된다() {
		// given
		sut.enqueue(1.0)
		guard let inputOperand = sut.dequeue() else { return }

		mockOperatorCalculatorItemQueue.enqueue(.subtract)
		guard let inputOperator = mockOperatorCalculatorItemQueue.dequeue() else { return }

		let dummyOperands: LinkedList<Double> = LinkedList<Double>()
		let operands = MockCalculatorItemQueue<Double>(list: dummyOperands)
		operands.enqueue(inputOperand)

		let dummyOperator: LinkedList<Operator> = LinkedList<Operator>()
		let `operator` = MockCalculatorItemQueue<Operator>(list: dummyOperator)
		`operator`.enqueue(inputOperator)

		// when
		let result = MockFormula(operands: operands, operators: `operator`)

		// then
		XCTAssertNotNil(result)
	}

	func tests_MockFormula_operator에_divide를_넣으면_초기값으로_할당된다() {
		// given
		sut.enqueue(1.0)
		guard let inputOperand = sut.dequeue() else { return }

		mockOperatorCalculatorItemQueue.enqueue(.divide)
		guard let inputOperator = mockOperatorCalculatorItemQueue.dequeue() else { return }

		let dummyOperands: LinkedList<Double> = LinkedList<Double>()
		let operands = MockCalculatorItemQueue<Double>(list: dummyOperands)
		operands.enqueue(inputOperand)

		let dummyOperator: LinkedList<Operator> = LinkedList<Operator>()
		let `operator` = MockCalculatorItemQueue<Operator>(list: dummyOperator)
		`operator`.enqueue(inputOperator)

		// when
		let result = MockFormula(operands: operands, operators: `operator`)

		// then
		XCTAssertNotNil(result)
	}

	func tests_MockFormula_operator에_multiply를_넣으면_초기값으로_할당된다() {
		// given
		sut.enqueue(1.0)
		guard let inputOperand = sut.dequeue() else { return }

		mockOperatorCalculatorItemQueue.enqueue(.multiply)
		guard let inputOperator = mockOperatorCalculatorItemQueue.dequeue() else { return }

		let dummyOperands: LinkedList<Double> = LinkedList<Double>()
		let operands = MockCalculatorItemQueue<Double>(list: dummyOperands)
		operands.enqueue(inputOperand)

		let dummyOperator: LinkedList<Operator> = LinkedList<Operator>()
		let `operator` = MockCalculatorItemQueue<Operator>(list: dummyOperator)
		`operator`.enqueue(inputOperator)

		// when
		let result = MockFormula(operands: operands, operators: `operator`)

		// then
		XCTAssertNotNil(result)
	}

	func tests_MockFormula_operands에_값을_넣으면_초기값으로_할당된다() {
		// given
		sut.enqueue(1.0)
		guard let inputOperand = sut.dequeue() else { return }

		mockOperatorCalculatorItemQueue.enqueue(.add)
		guard let inputOperator = mockOperatorCalculatorItemQueue.dequeue() else { return }

		let dummyOperands: LinkedList<Double> = LinkedList<Double>()
		let operands = MockCalculatorItemQueue<Double>(list: dummyOperands)
		operands.enqueue(inputOperand)

		let dummyOperator: LinkedList<Operator> = LinkedList<Operator>()
		let `operator` = MockCalculatorItemQueue<Operator>(list: dummyOperator)
		`operator`.enqueue(inputOperator)

		// when
		let result = MockFormula(operands: operands, operators: `operator`)
		guard let expection = result.operands?.dequeue() else { return }

		// then
		XCTAssertEqual(expection, 1.0)
	}


	func tests_MockFormula_results호출시_operands값이_반환된다() {
		// given
		let operands = sut
		operands?.enqueue(3.0)
		operands?.enqueue(2.0)

		let `operator` = mockOperatorCalculatorItemQueue
		`operator`?.enqueue(.add)

		// when
		let result = MockFormula<Double, Operator>(operands: operands as! MockCalculatorItemQueue<Double>, operators: `operator` as! MockCalculatorItemQueue<Operator>)
		let expection = result.result()

		// then
		XCTAssertEqual(expection, 5.0)
	}

	func tests_MockFormuls_results호출시_연산자가_add일경우_피연산자를_더한값을_반환한다() {
		// given
		let operands = sut!
		sut.enqueue(1.0)
		sut.enqueue(2.0)

		let `operator` = mockOperatorCalculatorItemQueue!
		`operator`.enqueue(.add)

		// when
		let result = MockFormula<Double, Operator>(operands: operands as! MockCalculatorItemQueue<Double>, operators: `operator` as! MockCalculatorItemQueue<Operator>)
		let expection = result.result()

		// then
		XCTAssertEqual(expection, 3.0)
	}

	func tests_MockFormula_results호출시_연산자가_subtract일경우_빼기_연산결과를_반환한다() {
		// given
		let operands = sut!
		sut.enqueue(3.0)
		sut.enqueue(1.0)

		let `operator` = mockOperatorCalculatorItemQueue!
		`operator`.enqueue(.subtract)

		// when
		let result = MockFormula<Double, Operator>(operands: operands as! MockCalculatorItemQueue<Double>, operators: `operator` as! MockCalculatorItemQueue<Operator>)
		let expection = result.result()

		// then
		XCTAssertEqual(expection, 2.0)
	}

	func tests_MockFormula_results호출시_연산자가_divide일경우_피연산자를_나누기한_연산결과를_반환한다() {
		// given
		let operands = sut!
		sut.enqueue(4.0)
		sut.enqueue(2.0)

		let `operator` = mockOperatorCalculatorItemQueue!
		`operator`.enqueue(.divide)

		// when
		let result = MockFormula<Double, Operator>(operands: operands as! MockCalculatorItemQueue<Double>, operators: `operator` as! MockCalculatorItemQueue<Operator>)
		let expection = result.result()

		// then
		XCTAssertEqual(expection, 2.0)
	}

	func tests_MockFormula_results호출시_연산자가_multiply일경우_피연산자를_곱한_연산결과를_반환한다() {
		// given
		let operands = sut!
		sut.enqueue(4.0)
		sut.enqueue(2.0)

		let `operator` = mockOperatorCalculatorItemQueue!
		`operator`.enqueue(.multiply)

		// when
		let result = MockFormula<Double, Operator>(operands: operands as! MockCalculatorItemQueue<Double>, operators: `operator` as! MockCalculatorItemQueue<Operator>)
		let expection = result.result()

		// then
		XCTAssertEqual(expection, 8.0)
	}

	func tests_MockExpressionParser_parse_호출시_MockFromula객체가반환된다() {
		// given
		let intput = "1+2"

		_ = sut!
		sut.enqueue(1)
		sut.enqueue(2)

		let operatorQueue = mockOperatorCalculatorItemQueue!
		operatorQueue.enqueue(.add)

		// when
		let result = MockExpressionParser<Double, Operator>.parse(from: intput)

		// then
		XCTAssertNotNil(result)
	}
}
