
import XCTest
@testable import Calculator

class CalculatorTests: XCTestCase {
    private var decimal: DecimalCalculator!

    override func setUpWithError() throws {
        decimal = DecimalCalculator()
    }

    override func tearDownWithError() throws {
        decimal = nil
    }

    func testForTest() {
        decimal.current = "5"
        try! decimal.calculate(.plus)
        decimal.current = "4"
        try! decimal.calculate(.minus)
        let numArray = decimal.getNumStack()
        let operatorArray = decimal.getOperatorStack()
        
        XCTAssertEqual(numArray, ["9"])
        XCTAssertEqual(operatorArray, [.minus])
    }
    
    func testPlusPlus() {
        decimal.current = "3"
        try! decimal.calculate(.plus)
        decimal.current = "4"
        try! decimal.calculate(.plus)
        let numArray = decimal.getNumStack()
        let operatorArray = decimal.getOperatorStack()
        
        XCTAssertEqual(numArray, ["7"])
        XCTAssertEqual(operatorArray, [.plus])
    }
    
    func testPlusMultiple() {
        decimal.current = "6"
        try! decimal.calculate(.plus)
        decimal.current = "3"
        try! decimal.calculate(.multiple)
        let numArray = decimal.getNumStack()
        let operatorArray = decimal.getOperatorStack()
        
        XCTAssertEqual(numArray, ["6", "3"])
        XCTAssertEqual(operatorArray, [.plus, .multiple])
    }
    
    func testPlusDivide() {
        decimal.current = "7"
        try! decimal.calculate(.plus)
        decimal.current = "9"
        try! decimal.calculate(.divide)
        let numArray = decimal.getNumStack()
        let operatorArray = decimal.getOperatorStack()
        
        XCTAssertEqual(numArray, ["7", "9"])
        XCTAssertEqual(operatorArray, [.plus, .divide])
    }
    
    func testMinusPlus() {
        decimal.current = "5"
        try! decimal.calculate(.minus)
        decimal.current = "4"
        try! decimal.calculate(.plus)
        let numArray = decimal.getNumStack()
        let operatorArray = decimal.getOperatorStack()
        
        XCTAssertEqual(numArray, ["1"])
        XCTAssertEqual(operatorArray, [.plus])
    }
    
    func testMinusMinus() {
        decimal.current = "5"
        try! decimal.calculate(.minus)
        decimal.current = "2"
        try! decimal.calculate(.minus)
        let numArray = decimal.getNumStack()
        let operatorArray = decimal.getOperatorStack()
        
        XCTAssertEqual(numArray, ["3"])
        XCTAssertEqual(operatorArray, [.minus])
    }
    
    func testMinusMultiple() {
        decimal.current = "5"
        try! decimal.calculate(.minus)
        decimal.current = "7"
        try! decimal.calculate(.multiple)
        let numArray = decimal.getNumStack()
        let operatorArray = decimal.getOperatorStack()
        
        XCTAssertEqual(numArray, ["5", "7"])
        XCTAssertEqual(operatorArray, [.minus, .multiple])
    }
    
    func testMinusDivide() {
        decimal.current = "5"
        try! decimal.calculate(.minus)
        decimal.current = "7"
        try! decimal.calculate(.divide)
        let numArray = decimal.getNumStack()
        let operatorArray = decimal.getOperatorStack()
        
        XCTAssertEqual(numArray, ["5", "7"])
        XCTAssertEqual(operatorArray, [.minus, .divide])
    }
    
    func testMultiplePlus() {
        decimal.current = "3"
        try! decimal.calculate(.multiple)
        decimal.current = "8"
        try! decimal.calculate(.plus)
        let numArray = decimal.getNumStack()
        let operatorArray = decimal.getOperatorStack()
        
        XCTAssertEqual(numArray, ["24"])
        XCTAssertEqual(operatorArray, [.plus])
    }
    
    func testMultipleMinus() {
        decimal.current = "2"
        try! decimal.calculate(.multiple)
        decimal.current = "8"
        try! decimal.calculate(.minus)
        let numArray = decimal.getNumStack()
        let operatorArray = decimal.getOperatorStack()
        
        XCTAssertEqual(numArray, ["16"])
        XCTAssertEqual(operatorArray, [.minus])
    }
    
    func testMultipleMultiple() {
        decimal.current = "3"
        try! decimal.calculate(.multiple)
        decimal.current = "6"
        try! decimal.calculate(.multiple)
        let numArray = decimal.getNumStack()
        let operatorArray = decimal.getOperatorStack()
        
        XCTAssertEqual(numArray, ["18"])
        XCTAssertEqual(operatorArray, [.multiple])
    }
    
    func testMultipleDivide() {
        decimal.current = "3"
        try! decimal.calculate(.multiple)
        decimal.current = "4"
        try! decimal.calculate(.divide)
        let numArray = decimal.getNumStack()
        let operatorArray = decimal.getOperatorStack()
        
        XCTAssertEqual(numArray, ["12"])
        XCTAssertEqual(operatorArray, [.divide])
    }
    
    func testDividePlus() {
        decimal.current = "6"
        try! decimal.calculate(.divide)
        decimal.current = "2"
        try! decimal.calculate(.plus)
        let numArray = decimal.getNumStack()
        let operatorArray = decimal.getOperatorStack()
        
        XCTAssertEqual(numArray, ["3"])
        XCTAssertEqual(operatorArray, [.plus])
    }
    
    func testDivideMinus() {
        decimal.current = "6"
        try! decimal.calculate(.divide)
        decimal.current = "6"
        try! decimal.calculate(.minus)
        let numArray = decimal.getNumStack()
        let operatorArray = decimal.getOperatorStack()
        
        XCTAssertEqual(numArray, ["1"])
        XCTAssertEqual(operatorArray, [.minus])
    }
    
    func testDivideMultiple() {
        decimal.current = "6"
        try! decimal.calculate(.divide)
        decimal.current = "2"
        try! decimal.calculate(.multiple)
        let numArray = decimal.getNumStack()
        let operatorArray = decimal.getOperatorStack()
        
        XCTAssertEqual(numArray, ["3"])
        XCTAssertEqual(operatorArray, [.multiple])
    }
    
    func testDivideDivde() {
        decimal.current = "8"
        try! decimal.calculate(.divide)
        decimal.current = "4"
        try! decimal.calculate(.divide)
        let numArray = decimal.getNumStack()
        let operatorArray = decimal.getOperatorStack()
        
        XCTAssertEqual(numArray, ["2"])
        XCTAssertEqual(operatorArray, [.divide])
    }
    
    
}
