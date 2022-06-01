//
//  FormularTest.swift
//  FormularTest
//
//  Created by bard, hugh on 2022/05/30.
//

import XCTest

@testable import Calculator
    
class FormularTest: XCTestCase {
    var sut: Formula?
    override func setUpWithError() throws {
        try super.setUpWithError()
        sut = Formula()
    }

    override func tearDownWithError() throws {
        try super.tearDownWithError()
        sut = nil
    }
    
    func test_연산자가하나일때_계산결과를제대로반환하는지() {
        //given
        sut?.operands.enQueue(1.0)
        sut?.operands.enQueue(2.0)
        sut?.operators.enQueue(.add)
        
        //when
        let input = try? sut?.result()
        let result: Double = 3.0
        
        //then
        XCTAssertEqual(result, input)
    }
    
    func test_사칙연산을순서대로따르지않고_계산이되고있는가() {
        //given
        sut?.operands.enQueue(1.0)
        sut?.operands.enQueue(4.0)
        sut?.operands.enQueue(3.0)
        sut?.operands.enQueue(1.0)
        sut?.operands.enQueue(1.0)
        
        sut?.operators.enQueue(.add)
        sut?.operators.enQueue(.multiply)
        sut?.operators.enQueue(.divide)
        sut?.operators.enQueue(.subtract)
        
        //when
        let result: Double = 12.0
        
        //then
        XCTAssertNotEqual(result, try sut?.result())
    }
    
    func test_마지막숫자가0일때_오류로던지는지() {
        //given
        sut?.operands.enQueue(1.0)
        sut?.operands.enQueue(2.0)
        sut?.operands.enQueue(3.0)
        sut?.operands.enQueue(0.0)
        
        sut?.operators.enQueue(.add)
        sut?.operators.enQueue(.multiply)
        sut?.operators.enQueue(.divide)
        
        //when
        
        //then
        XCTAssertThrowsError(try sut?.result())
    }
    
    func test_피연산자가_연산자보다카운트가하나더많지않을때_에러를던지는가() {
        //given
        sut?.operands.enQueue(1.0)
        sut?.operands.enQueue(2.0)
        sut?.operands.enQueue(3.0)
        sut?.operands.enQueue(4.0)
        sut?.operators.enQueue(.subtract)
        
        //when
        
        //then
        XCTAssertThrowsError(try sut?.result())
    }
    
    func test_피연산자가_연산자보다카운트가하나더많을때_연산이잘되는가() {
        //given
        sut?.operands.enQueue(1.0)
        sut?.operands.enQueue(2.0)
        sut?.operators.enQueue(.subtract)
        
        //when
        let result = -1.0
        
        //then
        XCTAssertEqual(result, try sut?.result())
    }
}
