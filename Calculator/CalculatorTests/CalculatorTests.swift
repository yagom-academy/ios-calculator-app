//
//  CalculatorTests.swift
//  CalculatorTests
//
//  Created by tae hoon park on 2021/06/28.
//

import XCTest
@testable import Calculator

class CalculatorTests: XCTestCase {

    var sut = Calculator()
    override func setUpWithError() throws {
    
    }

    func test_1더하기2더하기3의연산결과는_6이다() {
        XCTAssertEqual(sut.calculate(with: ["1", "+", "2", "+", "3"]),.success(6.0))
    }
    
    func test_1곱하기2곱하기3의결과는_6이다() {
        XCTAssertEqual(sut.calculate(with: ["1", "*", "2", "*", "3"]), .success(6.0))
    }
    
    func test_1빼기2빼기3의결과는_마이너스4이다() {
        XCTAssertEqual(sut.calculate(with: ["1", "-", "2", "-", "3"]), .success(-4.0))
    }
    
    func test_1나누기2나누기3의결과는_0쩜16667이다() {
        XCTAssertEqual(sut.calculate(with: ["1", "/", "2", "/", "3"]), .success(0.16667))
    }
    
    func test_1나누기2의결과는_0쩜5이다() {
    XCTAssertEqual(sut.calculate(with: ["1", "/", "2"]), .success(0.5))
    }
    
    func test_1곱하기3더하기2나누기2는_4다() {
    XCTAssertEqual(sut.calculate(with: ["1", "*", "3", "+", "2", "/", "2"]), .success(4))
    }
    
    func test_1곱하기3더하기2나누기0은_NaN이다() {
        XCTAssertEqual(sut.calculate(with: ["1", "*", "3", "+", "2", "/", "0"]), .failure(.dividedByZero))
    }
    
    func test_10쩜1더하기12쩜5나누기125더하기8빼기100곱하기13쩜8은_마이너스1361쩜8() {
        XCTAssertEqual(sut.calculate(with: ["10.1", "+", "12.5", "/", "125", "+", "8", "-", "100", "*", "13.8"]), .success(-1361.8))
    }
    
    override func tearDownWithError() throws {
  
    }


}
