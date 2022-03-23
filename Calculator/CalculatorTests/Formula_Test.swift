//
//  Formula_Test.swift
//  CalculatorTests
//
//  Created by SeoDongyeon on 2022/03/18.
//

import XCTest
@testable import Calculator

class Formula_Test: XCTestCase {
    private var doubleQueue = CalculatorItemQueue<Double>()
    private var operatorQueue = CalculatorItemQueue<Operator>()
    private var sut: Formula!

    override func setUpWithError() throws {
        try super.setUpWithError()
        
        doubleQueue.enqueue(-1.0)
        doubleQueue.enqueue(-2.0)
        doubleQueue.enqueue(-3.0)
        doubleQueue.enqueue(-4.0)
        doubleQueue.enqueue(-1.0)
        operatorQueue.enqueue(Operator.add)
        operatorQueue.enqueue(Operator.multiply)
        operatorQueue.enqueue(Operator.add)
        operatorQueue.enqueue(Operator.multiply)
        
        sut = Formula(operandQueue: doubleQueue, operatorQueue: operatorQueue)
    }

    override func tearDownWithError() throws {
        try super.tearDownWithError()
        sut = nil
    }
    
    func test_Formula테스트() throws {
        
        let result = try sut.result()
        
        XCTAssertEqual(result, -5.0)
    }
}
