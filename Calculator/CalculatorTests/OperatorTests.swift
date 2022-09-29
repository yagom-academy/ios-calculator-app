//  OperatorTests.swift
//  Created by zhilly on 2022/09/24.

import XCTest
@testable import Calculator

final class OperatorTests: XCTestCase {

    var sut: CalculatorItemQueue<Operator>!

    override func setUpWithError() throws {
        try super.setUpWithError()
        sut = CalculatorItemQueue()
    }

    override func tearDownWithError() throws {
        try super.tearDownWithError()
        sut = nil
    }
    
    func test_queue에Operator타입의add가enqueque하고dequeue했을때_dequeue값이add인지() {
        //given
        let data: Operator = .add
        
        //when
        sut.enqueue(data)
        let result = sut.dequeue()

        //then
        XCTAssertEqual(result, Operator.add)
    }
    
    func test_queue에Operator타입의divide와multiply가enqueque하고dequeue했을때_dequeue값이divide인지() {
        //given
        let dataArray: [Operator] = [.divide, .multiply]
        
        //when
        for data in dataArray {
            sut.enqueue(data)
        }
        
        let result = sut.dequeue()
        
        //then
        XCTAssertEqual(result, Operator.divide)
    }
    
    func test_1더하기1을calculate했을때_2인지() {
        //given
        let lhs: Double = 1.0
        let testOperator: Operator = .add
        let rhs: Double = 1.0
        
        //when
        let result = testOperator.calculate(lhs: lhs, rhs: rhs)
        
        //then
        XCTAssertEqual(result, 2.0)
    }
    
    func test_100더하기250을calculate했을때_350인지() {
        //given
        let lhs: Double = 100.0
        let testOperator: Operator = .add
        let rhs: Double = 250.0
        
        //when
        let result = testOperator.calculate(lhs: lhs, rhs: rhs)
        
        //then
        XCTAssertEqual(result, 350.0)
    }
    
    func test_100빼기200을calculate했을때_마이너스100인지() {
        //given
        let lhs: Double = 100.0
        let testOperator: Operator = .subtract
        let rhs: Double = 200.0
        
        //when
        let result = testOperator.calculate(lhs: lhs, rhs: rhs)
        
        //then
        XCTAssertEqual(result, -100.0)
    }
    
    func test_100을1으로나누는계산을calculate했을때_100인지() {
        //given
        let lhs: Double = 100.0
        let testOperator: Operator = .divide
        let rhs: Double = 1
        
        //when
        let result = testOperator.calculate(lhs: lhs, rhs: rhs)
        
        //then
        XCTAssertEqual(result, 100)
    }
    
    func test_100을0으로나누는계산을calculate했을때_nan인지() {
        //given
        let lhs: Double = 100.0
        let testOperator: Operator = .divide
        let rhs: Double = 0
        
        //when
        let result = testOperator.calculate(lhs: lhs, rhs: rhs)
        print(result)
        
        //then
        XCTAssertTrue(result.isNaN)
    }
    
    func test_10곱하기15를calculate했을때_150인지() {
        //given
        let lhs: Double = 10.0
        let testOperator: Operator = .multiply
        let rhs: Double = 15.0
        
        //when
        let result = testOperator.calculate(lhs: lhs, rhs: rhs)
        print(result)
        
        //then
        XCTAssertEqual(result, 150)
    }
}
