//
//  OperatorTest.swift
//  OperatorTest
//
//  Created by DuDu on 2022/03/18.
//

import XCTest
@testable import Calculator

class OperatorTest: XCTestCase {
    var sut: Operator?

    override func setUpWithError() throws {
        //sut = Operator.add
    }

    override func tearDownWithError() throws {
        sut = nil
    }
    
    func test_3과4를_add_Operator로_연산했을때_7이되어야한다() {
        //given
        sut = .add
        
        //when
        let result = try? sut?.calculate(lhs: 3, rhs: 4)
        
        //then
        XCTAssertEqual(result, 7)
    }
    
    func test_4와3을_substract_Operator로_연산했을때_1이되어야한다() {
        //given
        sut = .substract
        
        //when
        let result = try? sut?.calculate(lhs: 4, rhs: 3)
        
        //then
        XCTAssertEqual(result, 1)
    }
    
    func test_4와3을_multiply_Operator로_연산했을때_12가되어야한다() {
        //given
        sut = .multiply
        
        //when
        let result = try? sut?.calculate(lhs: 4, rhs: 3)
        
        //then
        XCTAssertEqual(result, 12)
    }
    
    func test_10과2를_divide_Operator로_연산했을때_5가되어야한다() {
        //given
        sut = .divide
        
        //when
        let result = try? sut?.calculate(lhs: 10, rhs: 2)
        
        //then
        XCTAssertEqual(result, 5)
    }
    
    func test_10과0을_divide_Operator로_연산했을때_error가나와야한다() {
        //given
        sut = .divide
        
        //when
        do {
            let result = try sut?.calculate(lhs: 10, rhs: 0)
            XCTAssertTrue(false)
        } catch (let error as CalculateError) {
            //then
            XCTAssertEqual(CalculateError.divideByZero, error)
        } catch {
            XCTAssertTrue(false)
        }
    }
}
