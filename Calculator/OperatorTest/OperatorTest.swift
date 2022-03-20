//
//  OperatorTest.swift
//  OperatorTest
//
//  Created by LIMGAUI on 2022/03/20.
//

import XCTest
@testable import Calculator

class OperatorTest: XCTestCase {
    var sut: Formula!
    var operands: CalculateItemQueue<Double>!
    var operators: CalculateItemQueue<Operator>!
    override func setUpWithError() throws {
        operands = CalculateItemQueue<Double>()
        operators = CalculateItemQueue<Operator>()
        sut = Formula(operands: operands, operators: operators)
    }
    override func tearDownWithError() throws {
        sut = nil
        operands = nil
        operators = nil
    }
    
    func test_add메서드호출시_마이너스10점5더하기_마이너스30점25값이_40점75가나오는지() throws {
        let numbers = [10.5, 30.25]
        let operatorValue = Operator(rawValue: "➕")!
        
        sut.operators.enqueue(operatorValue)
        let result = try sut.operators.dequeue?.calculate(lhs: numbers[0], rhs: numbers[1])
        
        XCTAssertEqual(result, 40.75)
    }
    
    func test_subtract메서드호출시_352점52345빼기_829점12345값이_마이너스476점6이나오는지() throws {
        let numbers = [352.52345, 829.12345]
        let operatorValue = Operator(rawValue: "➖")!
        
        sut.operators.enqueue(operatorValue)
        let result = try sut.operators.dequeue?.calculate(lhs: numbers[0], rhs: numbers[1])
        
        XCTAssertEqual(result, -476.6)
    }
    
    func test_divide메서드호출시_987점654나누기_123점456값이_8점000048600311041이나오는지()  throws {
        let numbers = [987.654, 123.456]
        let operatorValue = Operator(rawValue: "➗")!
        
        sut.operators.enqueue(operatorValue)
        let result = try sut.operators.dequeue?.calculate(lhs: numbers[0], rhs: numbers[1])
        
        XCTAssertEqual(result, 8.000048600311041)
    }
    
    func test_multiply메서드호출시_123점567곱하기_456점789값이_56444점0463623이나오는지()  throws {
        let numbers = [123.567, 456.789]
        let operatorValue = Operator(rawValue: "✖️")!
        
        sut.operators.enqueue(operatorValue)
        let result = try sut.operators.dequeue?.calculate(lhs: numbers[0], rhs: numbers[1])
        //부동소수점 오차발생? 56444.046362
        XCTAssertEqual(result, 56444.046362999994)
    }
}
