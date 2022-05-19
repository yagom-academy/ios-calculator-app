//
//  CalculatorTests.swift
//  CalculatorTests
//
//  Created by 이은찬 on 2022/05/16.
//

import XCTest
@testable import Calculator

class CalculatorTests: XCTestCase {
    var sutOperand: Queue<Double>!
    var sutOperator: Queue<Operator>!
    var formula: Formula!
    
    override func setUpWithError() throws {
        try super.setUpWithError()
        sutOperand = Queue<Double>()
        sutOperator = Queue<Operator>()
        formula = Formula()
    }
    
    override func tearDownWithError() throws {
        try super.tearDownWithError()
        sutOperand = nil
        sutOperator = nil
        formula = nil
    }
    
    func test_enqueue를안했을때_isEmpty가_참인지확인() {
        let result = sutOperand.isEmpty
        XCTAssertTrue(result)
    }
    
    func test_enqueue했을때_isEmpty가_거짓인지확인() {
        sutOperand.enqueue(1)
        let result = sutOperand.isEmpty
        XCTAssertFalse(result)
    }
    
    func test_Enqueue를여러번했을때_count값이_같은지확인() {
        sutOperand.enqueue(1)
        sutOperand.enqueue(2)
        sutOperand.enqueue(5)
        let result = sutOperand.count
        XCTAssertEqual(result, 3)
    }
    
    func test_enqueue를여러번했을때_dequeue를하면_count가맞는지확인() {
        sutOperand.enqueue(1)
        sutOperand.enqueue(2)
        sutOperand.enqueue(3)
        sutOperand.dequeue()
        let result = sutOperand.count
        XCTAssertEqual(result, 2)
    }
    
    func test_enqueue를여러번했을때_dequeue를하면_반환값이같은지확인() {
        sutOperand.enqueue(1)
        sutOperand.enqueue(2)
        sutOperand.enqueue(3)
        let result = sutOperand.dequeue()
        XCTAssertEqual(result, 1)
    }
    
    func test_enqueue를하지않았을때_dequeue를하면_nil이나오는지확인() {
        let a = sutOperand.dequeue()
        XCTAssertEqual(nil, a)
    }
    
    func test_값이들어있을때_removeAll을하면_count가0인지확인() {
        sutOperand.enqueue(1)
        sutOperand.enqueue(2)
        sutOperand.enqueue(3)
        sutOperand.removeAll()
        let result = sutOperand.count
        XCTAssertEqual(result, 0)
    }
    
    func test_값이들어있을때_removeAll을하면_isEmpty가참인지확인() {
        sutOperand.enqueue(1)
        sutOperand.enqueue(2)
        sutOperand.enqueue(3)
        sutOperand.removeAll()
        let result = sutOperand.isEmpty
        XCTAssertTrue(result)
    }
    
    func test_값이들어있을때_dequeue로queue를비웠을때_count값과nil값이나오는지확인() {
        sutOperand.enqueue(1)
        sutOperand.enqueue(2)
        var result = sutOperand.firstValue
        XCTAssertEqual(result, 1)
        sutOperand.dequeue()
        let result1 = sutOperand.firstValue
        XCTAssertEqual(result1, 2)
        sutOperand.dequeue()
        let result2 = sutOperand.firstValue
        XCTAssertEqual(result2, nil)
        sutOperand.enqueue(5)
        let result3 = sutOperand.firstValue
        XCTAssertEqual(result3, 5)
        sutOperand.dequeue()
        let result4 = sutOperand.firstValue
        XCTAssertEqual(result4, nil)
        let result5 = sutOperand.count
        XCTAssertEqual(result5, 0)
    }
    
    func test_입력된숫자가하나일때_대입연산자를누르면_입력된숫자가나오는지확인() {
        //given
        formula.operands.enqueue(123.0)
        //when
        let result = formula.result()
        //then
        XCTAssertEqual(result, 123.0)
    }
}
