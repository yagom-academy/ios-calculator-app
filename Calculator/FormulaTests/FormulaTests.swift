//
//  FormulaTests.swift
//  FormulaTests
//
//  Created by leewonseok on 2022/09/21.
//

import XCTest
@testable import Calculator

class FormulaTests: XCTestCase {
    var sut: Formula!
    
    override func setUpWithError() throws {
        try super.setUpWithError()
        sut = Formula()
    }

    override func tearDownWithError() throws {
        try super.tearDownWithError()
        sut = nil
    }
    
    func test_1더하기_1을했을때_2이_되는지() {
        let result: Double = 2
        
        sut.operands.enqueue(1)
        sut.operands.enqueue(1)
        sut.operators.enqueue(Operator.add)
        
        XCTAssertEqual(result, try sut.result())
    }
    
    func test_마이너스연산을_두번했을시_정상적으로_마이너스값이나오는지() {
        let result: Double = -2
        
        sut.operands.enqueue(0)
        sut.operands.enqueue(1)
        sut.operands.enqueue(1)
        sut.operators.enqueue(Operator.subtract)
        sut.operators.enqueue(Operator.subtract)
        
        XCTAssertEqual(result, try sut.result())
    }
    
    func test_더하기연산을_100번할시_성공하는지(){
        var numbers: [Double] = []
        
        for _ in 0..<100 {
            numbers.append(Double.random(in: 0...100))
        }
        
        numbers.forEach {
            sut.operands.enqueue($0)
        }
        
        for _ in 0..<99 {
            sut.operators.enqueue(Operator.add)
        }
        
        XCTAssertEqual(numbers.reduce(0, +), try sut.result())
    }
    
    func test_0을곱했을떄_결과값이_0인지(){
        let result: Double = 0
        
        sut.operands.enqueue(Double.random(in: 0...100))
        sut.operands.enqueue(Double.random(in: 0...100))
        sut.operands.enqueue(0)
        sut.operands.enqueue(Double.random(in: 0...100))
        sut.operators.enqueue(Operator.multiply)
        sut.operators.enqueue(Operator.multiply)
        sut.operators.enqueue(Operator.multiply)
        
        XCTAssertEqual(result, try sut.result())
    }
    
    func test_3을_3으로_곱했을때_결과값이9인지() {
        let result: Double = 9
        
        sut.operands.enqueue(3)
        sut.operands.enqueue(3)
        sut.operators.enqueue(Operator.multiply)
        
        XCTAssertEqual(result, try sut.result())
    }
    
    func test_3을_3으로_나누었을때_결과값이1인지() {
        let result: Double = 1
        
        sut.operands.enqueue(3)
        sut.operands.enqueue(3)
        sut.operators.enqueue(Operator.divide)
        
        XCTAssertEqual(result, try sut.result())
    }
    
    func test_0으로_나누었을때_에러를던지는지() {
        sut.operands.enqueue(3)
        sut.operands.enqueue(0)
        sut.operators.enqueue(Operator.divide)
        
        XCTAssertThrowsError(try sut.result())
    }
    
}
