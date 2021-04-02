//
//  CalculatorTests.swift
//  CalculatorTests
//
//  Created by 천수현 on 2021/03/29.
//
import XCTest

class DecimalCalculatorTests: XCTestCase {
    private var decimalCalculatorTest: DecimalCalculator?
    
    override func setUpWithError() throws {
        decimalCalculatorTest = DecimalCalculator()
    }
    
    override func tearDownWithError() throws {
        decimalCalculatorTest = nil
    }
    
    func test_add() {
        let result1 =  DecimalCalculator.add(firstNumber: "100", secondNumber: "200")
        XCTAssertEqual(result1, "300")
        
        let result2 =  DecimalCalculator.add(firstNumber: "100", secondNumber: "-200")
        XCTAssertEqual(result2, "-100")
        
        let result3 =  DecimalCalculator.add(firstNumber: "900000000", secondNumber: "200000000")
        XCTAssertEqual(result3, "100000000")
        
        let result4 =  DecimalCalculator.add(firstNumber: "100", secondNumber: "0")
        XCTAssertEqual(result4, "100")
        
        let result5 =  DecimalCalculator.add(firstNumber: "123.123", secondNumber: "321.321")
        XCTAssertEqual(result5, "444.444")
        
        let result6 =  DecimalCalculator.add(firstNumber: "10.5", secondNumber: "-11.8")
        XCTAssertEqual(result6, "-1.3")
    }
    
    func test_subtract() {
        let result1 =  DecimalCalculator.subtract(firstNumber: "100", secondNumber: "200")
        XCTAssertEqual(result1, "-100")
        
        let result2 =  DecimalCalculator.subtract(firstNumber: "100", secondNumber: "-200")
        XCTAssertEqual(result2, "300")
        
        let result3 =  DecimalCalculator.subtract(firstNumber: "900000000", secondNumber: "200000000")
        XCTAssertEqual(result3, "700000000")
        
        let result4 =  DecimalCalculator.subtract(firstNumber: "100", secondNumber: "0")
        XCTAssertEqual(result4, "100")
        
        let result5 =  DecimalCalculator.subtract(firstNumber: "123.123", secondNumber: "321.321")
        XCTAssertEqual(result5, "-198.198")
        
        let result6 =  DecimalCalculator.subtract(firstNumber: "10.5", secondNumber: "-11.8")
        XCTAssertEqual(result6, "22.3")
    }
    
    func test_multiply() {
        let result1 =  DecimalCalculator.multiply(firstNumber: "100", secondNumber: "200")
        XCTAssertEqual(result1, "20000")
        
        let result2 =  DecimalCalculator.multiply(firstNumber: "100", secondNumber: "-200")
        XCTAssertEqual(result2, "-20000")
        
        let result3 =  DecimalCalculator.multiply(firstNumber: "10000", secondNumber: "100000")
        XCTAssertEqual(result3, "0")
        
        let result4 =  DecimalCalculator.multiply(firstNumber: "100", secondNumber: "0")
        XCTAssertEqual(result4, "0")
        
        let result5 =  DecimalCalculator.multiply(firstNumber: "123.123", secondNumber: "321.321")
        XCTAssertEqual(result5, "39562.005483")
        
        let result6 =  DecimalCalculator.multiply(firstNumber: "10.5", secondNumber: "-11.8")
        XCTAssertEqual(result6, "-123.9")
    }
    
    func test_divide() {
        let result1 =  DecimalCalculator.divide(firstNumber: "100", secondNumber: "200")
        XCTAssertEqual(result1, "0.5")
        
        let result2 =  DecimalCalculator.divide(firstNumber: "100", secondNumber: "-200")
        XCTAssertEqual(result2, "-0.5")
        
        let result3 =  DecimalCalculator.divide(firstNumber: "10000", secondNumber: "100000")
        XCTAssertEqual(result3, "0.1")
        
        let result4 =  DecimalCalculator.divide(firstNumber: "100", secondNumber: "0")
        XCTAssertEqual(result4, "NaN")
        
        let result5 =  DecimalCalculator.divide(firstNumber: "123.123", secondNumber: "321.321")
        XCTAssertEqual(result5, "0.38317757")
        
        let result6 =  DecimalCalculator.divide(firstNumber: "10.5", secondNumber: "-11.8")
        XCTAssertEqual(result6, "-0.889830508")
    }
    
}
