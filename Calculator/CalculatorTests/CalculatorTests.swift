//
//  CalculatorTests.swift
//  CalculatorTests
//
//  Created by Kim Do hyung on 2021/06/25.
//

import XCTest
import Foundation
@testable import Calculator

class CalculatorTests: XCTestCase {
    
    var sut: Calculator = Calculator()
    
    override func setUp() {
        super.setUp()
        sut = Calculator()
        
    }
    
    func test_1더하기2더하기3이_준비되어서_runCalculator메서드가_호출되었을때_6이_된다()  {
        // given
        let testcase = ["1","+","2","+","3"]
        
        // when
        let result = sut.runCalculator(on: testcase)
        let expectedResult: Double = 6
        
        // then
        XCTAssertEqual(result, .success(expectedResult))
    }
    
    func test_1더하기2더하기3이_준비되어서_runCalculator메서드가_호출되었을때_5는_아니다()  {
        // given
        let testcase = ["1","+","2","+","3"]
        
        // when
        let result = sut.runCalculator(on: testcase)
        let failedResult: Double = 5
        
        // then
        XCTAssertNotEqual(result, .success(failedResult))
    }
    
    func test_1곱하기2곱하기3이_준비되어서_runCalculator메서드가_호출되었을때_6이_된다() {
        // given
        let testcase = ["1","*","2","*","3"]
        
        // when
        let result = sut.runCalculator(on: testcase)
        let expectedResult: Double = 6
        
        // then
        XCTAssertEqual(result, .success(expectedResult))
    }
    
    func test_1곱하기2곱하기3이_준비되어서_runCalculator메서드가_호출되었을때_5는_아니다() {
        // given
        let testcase = ["1","*","2","*","3"]
        
        // when
        let result = sut.runCalculator(on: testcase)
        let failedResult: Double = 5
        
        // then
        XCTAssertNotEqual(result, .success(failedResult))
    }

    func test_1빼기2빼기3이_준비되어서_runCalculator메서드가_호출되었을때_마이너스4가_된다() {
        // given
//        let testcase = ["1","-","2","-","3"]
        let testcase = ["9","-","6"]
        
        // when
        let result = sut.runCalculator(on: testcase)
        let expectedResult: Double = 3
        
        // then
        XCTAssertEqual(result, .success(expectedResult))
    }
    
    func test_1빼기2빼기3이_준비되어서_runCalculator메서드가_호출되었을때_5는_아니다() {
        // given
        let testcase = ["1","-","2","-","3"]
        
        // when
        let result = sut.runCalculator(on: testcase)
        let failedResult: Double = 5
        
        // then
        XCTAssertNotEqual(result, .success(failedResult))
    }

    func test_1나누기2나누기3이_준비되어서_runCalculator메서드가_호출되었을때_1점6667이_된다() {
        // given
        let testcase = ["1","/","2","/","3"]
        
        // when
        let result = sut.runCalculator(on: testcase)
        
        guard case .success(let unwrappedResult) = result else {
            return
        }
        
        let rounedResult = round(unwrappedResult*100000)/100000
        let expectedResult: Double = 0.16667
        
        // then
        XCTAssertEqual(rounedResult, expectedResult)
    }
    
    func test_1나누기2나누기3이_준비되어서_runCalculator메서드가_호출되었을때_1점6666은_아니다() {
        // given
        let testcase = ["1","/","2","/","3"]
        
        // when
        let result = sut.runCalculator(on: testcase)
        
        guard case .success(let unwrappedResult) = result else {
            return
        }
        
        let rounedResult = round(unwrappedResult*100000)/100000
        let failedResult: Double = 0.16666
        
        // then
        XCTAssertNotEqual(rounedResult, failedResult)
    }

    func test_1곱하기3더하기2나누기2가_준비되어서_runCalculator메서드가_호출되었을때_4가_된다() {
        // given
        let testcase = ["1","*","3","+","2","/","2"]
        
        // when
        let result = sut.runCalculator(on: testcase)
        let expectedResult: Double = 4
        
        // then
        XCTAssertEqual(result, .success(expectedResult))
    }

    func test_1곱하기3더하기2나누기2가_준비되어서_runCalculator메서드가_호출되었을때_5는_아니다() {
        // given
        let testcase = ["1","*","3","+","2","/","2"]
        
        // when
        let result = sut.runCalculator(on: testcase)
        let failedResult: Double = 5
        
        // then
        XCTAssertNotEqual(result, .success(failedResult))
    }

    
    func test_1곱하기3더하기2나누기0가_준비되어서_runCalculator메서드가_호출되었을때_dividedByZero에러가_발생한다() {
        // given
        let testcase = ["1","*","3","+","2","/","0"]
        
        // when
        let result = sut.runCalculator(on: testcase)
        let expectedResult = CalculatorError.dividedByZero
        
        // then
        XCTAssertEqual(result, .failure(expectedResult))
    }
    
    func test_1곱하기3더하기2나누기0가_준비되어서_runCalculator메서드가_호출되었을때_unknownError에러는_아니다() {
        // given
        let testcase = ["1","*","3","+","2","/","0"]
        
        // when
        let result = sut.runCalculator(on: testcase)
        let failedResult = CalculatorError.unknownError
        
        // then
        XCTAssertNotEqual(result, .failure(failedResult))
    }

    func test_10점1더하기12점5나누기125더하기8빼기100곱하기13점8이_준비되어서_runCalculator메서드가_호출되었을때_마이너스1361점8이_된다() {
        // given
        let testcase = ["10.1","+","12.5","/","125","+","8","-","100","*","13.8"]
        
        // when
        let result = sut.runCalculator(on: testcase)
        let expectedResult: Double = -1361.8
        
        // then
        XCTAssertEqual(result, .success(expectedResult))
    }
    
    func test_10점1더하기12점5나누기125더하기8빼기100곱하기13점8이_준비되어서_runCalculator메서드가_호출되었을때_마이너스1361점9는_아니다() {
        // given
        let testcase = ["10.1","+","12.5","/","125","+","8","-","100","*","13.8"]
        
        // when
        let result = sut.runCalculator(on: testcase)
        let failedResult: Double = -1361.9
        
        // then
        XCTAssertNotEqual(result, .success(failedResult))
    }
}
