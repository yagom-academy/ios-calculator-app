//
//  ComputableTests.swift
//  CalculatorTests
//
//  Created by Kim Do hyung on 2021/06/29.
//

import XCTest
import Foundation
@testable import Calculator


class ComputableTests: XCTestCase {
    
    func test_Operator의_모든_case를_준비하여_플러스연산자의_isLowerPriority메서드를_호출하면_모두_true가_된다() {
        let sut = Operator.plus
        
        // given
        let testcase1 = Operator.divide
        let testcase2 = Operator.minus
        let testcase3 = Operator.multiply
        let testcase4 = Operator.plus
        
        // when
        let testReuslt1 = sut.isLowerPriority(than: testcase1)
        let testReuslt2 = sut.isLowerPriority(than: testcase2)
        let testReuslt3 = sut.isLowerPriority(than: testcase3)
        let testReuslt4 = sut.isLowerPriority(than: testcase4)
        
        //then
        XCTAssertEqual(testReuslt1, true)
        XCTAssertEqual(testReuslt2, true)
        XCTAssertEqual(testReuslt3, true)
        XCTAssertEqual(testReuslt4, true)
    }
    
    func test_divide_Operator를_준비하여_플러스연산자의_isLowerPriority메서드를_호출하면_flase는_아니다() {
        let sut = Operator.plus
        
        // given
        let testcase = Operator.divide
        
        // when
        let testReuslt = sut.isLowerPriority(than: testcase)
        
        //then
        XCTAssertNotEqual(testReuslt, false)
    }
    
    
    func test_3으로_초기화한_Operand을_준비하여_1로_초기화한_Operand의_plus메서드를_호출하면_4가_나온다() {
        let sut = Operand(operand: 1)
        
        //given
        let testcase = Operand(operand: 3)
        
        //when
        let result = sut.plus(with: testcase)
        let expectedResult: Double = 4
        
        //then
        XCTAssertEqual(result,expectedResult)
    }
    
    func test_3으로_초기화한_Operand을_준비하여_1로_초기화한_Operand의_plus메서드를_호출하면_2는_아니다() {
        let sut = Operand(operand: 1)
        
        //given
        let testcase = Operand(operand: 3)
        
        //when
        let result = sut.plus(with: testcase)
        let failedResult: Double = 2
        
        //then
        XCTAssertNotEqual(result, failedResult)
    }
    
    func test_2로_초기화한_Operand을_준비하여_7로_초기화한_Operand의_minus메서드를_호출하면_5가_나온다() {
        
        let sut = Operand(operand: 7)
        
        //given
        let testcase = Operand(operand: 2)
        
        //when
        let result = sut.minus(with: testcase)
        let expectedResult: Double = 5
        
        //then
        XCTAssertEqual(result,expectedResult)
    }
    
    func test_2로_초기화한_Operand을_준비하여_7로_초기화한_Operand의_minus메서드를_호출하면_2는_아니다() {
        
        let sut = Operand(operand: 7)
        
        //given
        let testcase = Operand(operand: 2)
        
        //when
        let result = sut.minus(with: testcase)
        let failedResult: Double = 2
        
        //then
        XCTAssertNotEqual(result, failedResult)
    }
    
    func test_6으로_초기화한_Operand을_준비하여_4로_초기화한_Operand의_multiple메서드를_호출하면_24가_나온다() {
        let sut = Operand(operand: 4)
        
        //given
        let testcase = Operand(operand: 6)
        
        //when
        let result = sut.multiple(with: testcase)
        let expectedResult: Double = 24
        
        //then
        XCTAssertEqual(result,expectedResult)
    }
    
    func test_6으로_초기화한_Operand을_준비하여_4로_초기화한_Operand의_multiple메서드를_호출하면_2는_아니다() {
        let sut = Operand(operand: 4)
        
        //given
        let testcase = Operand(operand: 6)
        
        //when
        let result = sut.multiple(with: testcase)
        let failedResult: Double = 2
        
        //then
        XCTAssertNotEqual(result, failedResult)
    }
    
    func test_3으로_초기화한_Operand을_준비하여_6으로_초기화한_Operand의_divide메서드를_호출하면_2가_나온다() {
        do {
            let sut = Operand(operand: 6)
            
            //given
            let testcase = Operand(operand: 3)
            
            //when
            let result = try sut.divide(by: testcase)
            let expectedResult: Double = 2
            
            //then
            XCTAssertEqual(result,expectedResult)
        } catch {
            print("에러발생")
        }
    }
    
    func test_3으로_초기화한_Operand을_준비하여_6으로_초기화한_Operand의_divide메서드를_호출하면_3은_아니다() {
        do {
            let sut = Operand(operand: 6)
            
            //given
            let testcase = Operand(operand: 3)
            
            //when
            let result = try sut.divide(by: testcase)
            let failedResult: Double = 3
            
            //then
            XCTAssertNotEqual(result, failedResult)
        } catch {
            print("에러발생")
        }
    }
}
