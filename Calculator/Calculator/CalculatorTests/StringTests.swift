//
//  StringTests.swift
//  CalculatorTests
//

import XCTest
@testable import Calculator

class StringTests: XCTestCase {
    var sut: String?
    
    let testCase1 = "ad-fa-4qs-ㄹ"
    let testCase2 = "11sa4+a1243"
    let testCase3 = "1sw10sd/1asf"
    let testCase4 = "123as-12jsl"
    let testCase5 = "192asod*12jn"
    
    override func setUpWithError() throws {
        sut = ""
    }

    override func tearDownWithError() throws {
        sut = nil
    }
    
    func test_Split함수실행시_더하기로자르면_true리턴() {
        sut = testCase2
        
        guard let sutArr = sut?.split(with: Character(Operator.add.description)) else {
            XCTAssert(false)
            return
        }
        
        if sutArr[0] == "11sa4", sutArr[1] == "a1243" {
            XCTAssert(true)
        } else {
            XCTAssert(false)
        }
    }

    func test_Split함수실행시_나누기로자르면_true리턴() {
        sut = testCase3
        
        guard let sutArr = sut?.split(with: Character(Operator.divide.description)) else {
            XCTAssert(false)
            return
        }
        
        if sutArr[0] == "1sw10sd", sutArr[1] == "1asf" {
            XCTAssert(true)
        } else {
            XCTAssert(false)
        }
    }

    func test_Split함수실행시_빼기로자르면_true리턴() {
        sut = testCase4
        
        guard let sutArr = sut?.split(with: Character(Operator.substract.description)) else {
            XCTAssert(false)
            return
        }
        
        if sutArr[0] == "123as", sutArr[1] == "12jsl" {
            XCTAssert(true)
        } else {
            XCTAssert(false)
        }
    }
    
    func test_Split함수실행시_곱하기로자르면_true리턴() {
        sut = testCase5
        
        guard let sutArr = sut?.split(with: Character(Operator.multiply.description)) else {
            XCTAssert(false)
            return
        }
        
        if sutArr[0] == "192asod", sutArr[1] == "12jn" {
            XCTAssert(true)
        } else {
            XCTAssert(false)
        }
    }
    
    func test_split함수실행시_연산자가여러개있어도_각각모두분리_true리턴() {
        sut = testCase1
        
        guard let sutArr = sut?.split(with: Character(Operator.substract.description)) else {
            XCTAssert(false)
            return
        }
        
        if sutArr[0] == "ad", sutArr[1] == "fa", sutArr[2] == "4qs", sutArr[3] == "ㄹ"{
            XCTAssert(true)
        } else {
            XCTAssert(false)
        }
    }
}
