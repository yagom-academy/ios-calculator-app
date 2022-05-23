//
//  FormulaTests.swift
//  FormulaTests
//
//  Created by 김동용 on 2022/05/19.
//

import XCTest
@testable import Calculator

class FormulaTests: XCTestCase {
    var sut: Formula?
    
    override func setUpWithError() throws {
        try super.setUpWithError()
        sut = Formula()
    }
    
    override func tearDownWithError() throws {
        try super.tearDownWithError()
        sut = nil
    }
    
    func test_두숫자를_operands에넣어주고_operators_에더하기연산자를넣어주고_result함수를_호출하면_4를반환하는가() {
        //given
        sut?.operands.enQueue(1.0)
        sut?.operators.enQueue(.add)
        sut?.operands.enQueue(3.0)
        var result: Double? = 0
        
        //when
        do {
            result = try sut?.result()
        } catch {
            print(QueueError.unknown.errorDescription)
        }
        let input = 4.0
        
        //then
        XCTAssertEqual(result, input)
    }
    
    func test_여러숫자들을_operands에넣어주고_operators_에여러연산자를넣어주고_result함수를_호출하면_제대로값을반환하는가() {
        //given
        sut?.operands.enQueue(1.0)
        sut?.operators.enQueue(.add)
        sut?.operands.enQueue(3.0)
        sut?.operators.enQueue(.multiply)
        sut?.operands.enQueue(2.0)
        sut?.operators.enQueue(.subtract)
        sut?.operands.enQueue(3.0)
        sut?.operators.enQueue(.subtract)
        sut?.operands.enQueue(1.0)
        sut?.operators.enQueue(.divide)
        sut?.operands.enQueue(2.0)
        
        var result: Double? = 0
        
        //when
        do {
            result = try sut?.result()
        } catch {
            print(QueueError.unknown.errorDescription)
        }
        let input = 2.0
        
        //then
        XCTAssertEqual(result, input)
    }
    
    func test_두번째숫자가0이면_에러숫자를반환하는가() {
        //given
        sut?.operands.enQueue(3.0)
        sut?.operators.enQueue(.divide)
        sut?.operands.enQueue(0.0)

        //when
        
        //then
        XCTAssertThrowsError(try sut?.result())
    } 
}
