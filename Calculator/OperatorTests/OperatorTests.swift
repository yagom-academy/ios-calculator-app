//
//  OperatorTests.swift
//  OperatorTests
//
//  Created by Kiseok on 2023/10/11.
//

import XCTest
@testable import Calculator

final class OperatorTests: XCTestCase {
    var sut: Operator!

    override func tearDownWithError() throws {
        sut = nil
    }
    
    func test_operator가add케이스이고lhs와rhs가각각1일때_calculate호출시2가나오는지() throws {
        //given
        sut = Operator.add
        let lhs: Double = 1
        let rhs: Double = 1
        
        //when
        let result = sut.calculate(lhs: lhs, rhs: rhs)
        
        //then
        XCTAssertEqual(result, 2)
    }
    
    func test_operator가subtract케이스이고lhs와rhs가각각2와1일때_calculate호출시1이나오는지()  {
        //given
        sut = Operator.subtract
        let lhs: Double = 2
        let rhs: Double = 1
        
        //when
        let result = sut.calculate(lhs: lhs, rhs: rhs)
        
        //then
        XCTAssertEqual(result, 1)
    }
    
    func test_operator가divide케이스이고lhs와rhs가각각4와2일때_calculate호출시2가나오는지() {
        //given
        sut = Operator.divide
        let lhs: Double = 4
        let rhs: Double = 2
        
        //when
        let result = sut.calculate(lhs: lhs, rhs: rhs)
        
        //then
        XCTAssertEqual(result, 2)
    }
    
    
    
    func test_operator가multiply케이스이고lhs와rhs가각각4와2일때_calculate호출시8이나오는지() {
        //given
        sut = Operator.multiply
        let lhs: Double = 4
        let rhs: Double = 2
        
        //when
        let result = sut.calculate(lhs: lhs, rhs: rhs)
        
        //then
        XCTAssertEqual(result, 8)
    }
    
    func test_operator가divide케이스이고lhs가4rhs가0일때_calculate호출시nan이나오는지() {
        //given
        sut = Operator.divide
        let lhs: Double = 4
        let rhs: Double = 0
        
        //when
        let result = sut.calculate(lhs: lhs, rhs: rhs)
        
        //then
        XCTAssertTrue(result.isNaN)
    }
    

}
