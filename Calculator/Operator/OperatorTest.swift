//
//  Operator.swift
//  Operator
//
//  Created by Kiwon Song on 2022/05/19.
//

import XCTest
@testable import Calculator
class OperatorTest: XCTestCase {
    var sut: Operator!
    
    override func setUpWithError() throws {
        
    }
    
    override func tearDownWithError() throws {
        sut = nil
    }
    
    func test_두수를_add로_연산했을때_더하기가_되어야한다() {
        //given
        sut = .add
        
        //when
        let result = sut.calculate(lhs: 1, rhs: 2)
        
        //then
        XCTAssertEqual(result, 3)
    }
    
    func test_두수를_subtract로_연산했을때_빼기가_되어야한다() {
        //given
        sut = .substract
        
        //when
        let result = sut.calculate(lhs: 2, rhs: 1)
        
        //then
        XCTAssertEqual(result, 1)
    }
    
}
