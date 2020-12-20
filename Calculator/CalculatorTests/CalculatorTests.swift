
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
    
    func testDivideZero() {
        decimal.current = "8"
        try! decimal.calculate(.divide)
        decimal.current = "0"
        try! decimal.calculate(.plus) // 여기서 에러
        let getCurrent = decimal.getCurrent()
        
        XCTAssertEqual(getCurrent, "오류")
    }
    
    func testDivdeZeroPlus() {
        decimal.current = "8"
        try! decimal.calculate(.divide)
        decimal.current = "0"
        try! decimal.calculate(.plus) // 여기서 에러
        decimal.current = "3"
        try! decimal.printResult()
        let getCurrent = decimal.getCurrent()

        XCTAssertEqual(getCurrent, "오류")
    }
    
    func testBigNumber() {
        decimal.current = "1111111111"
        try! decimal.calculate(.plus)
        decimal.current = "12345678912"
        try! decimal.calculate(.multiple)
        
        
        let numArray = decimal.getNumStack()
        let operatorArray = decimal.getOperatorStack()
        
        XCTAssertEqual(numArray, ["111111111", "123456789"])
        XCTAssertEqual(operatorArray, [.plus, .multiple])
    }
    
    func testDoubleToInt() {
        decimal.current = "8.3"
        try! decimal.calculate(.plus)
        decimal.current = "4.7"
        try! decimal.printResult()
        
        let numArray = decimal.getNumStack()
        let operatorArray = decimal.getOperatorStack()
        
        XCTAssertEqual(numArray, ["13"])
        XCTAssertEqual(operatorArray, [])
    }
    
    func testBigDouble() {
        decimal.current = "1253.393848"
        try! decimal.calculate(.plus)
        decimal.current = "32526242524.9"
        try! decimal.calculate(.multiple)
        
        let numArray = decimal.getNumStack()
        
        XCTAssertEqual(numArray, ["1253.39384", "3252624252"])
    }
    
    func testDoubleLastZero() {
        decimal.current = "8.345"
        try! decimal.calculate(.plus)
        decimal.current = "4.725"
        try! decimal.printResult()
        
        let numArray = decimal.getNumStack()
        
        XCTAssertEqual(numArray, ["13.07"])
    }
    
    func testFirstPlus() {
        try! decimal.calculate(.plus)
        let numArray = decimal.getNumStack()
        let operatorArray = decimal.getOperatorStack()
        
        XCTAssertEqual(numArray, ["0"])
        XCTAssertEqual(operatorArray, [.plus])
    }
    
    func testFirstMinus() {
        try! decimal.calculate(.minus)
        let numArray = decimal.getNumStack()
        let operatorArray = decimal.getOperatorStack()
        
        XCTAssertEqual(numArray, ["0"])
        XCTAssertEqual(operatorArray, [.minus])
    }
    
    func testFirstMultiple() {
        try! decimal.calculate(.multiple)
        let numArray = decimal.getNumStack()
        let operatorArray = decimal.getOperatorStack()
        
        XCTAssertEqual(numArray, ["0"])
        XCTAssertEqual(operatorArray, [.multiple])
    }
    
    func testFirstDivide() {
        try! decimal.calculate(.divide)
        let numArray = decimal.getNumStack()
        let operatorArray = decimal.getOperatorStack()
        
        XCTAssertEqual(numArray, ["0"])
        XCTAssertEqual(operatorArray, [.divide])
    }
    
    func testFirstPrintResult() {
        try! decimal.printResult()
        let numArray = decimal.getNumStack()
        let operatorArray = decimal.getOperatorStack()
        
        XCTAssertEqual(numArray, ["0"])
        XCTAssertEqual(operatorArray, [])
    }
    
    func testBigNegativeNumber() {
        decimal.current = "-2421242897242"
        try! decimal.calculate(.plus)
        decimal.current = "3"
        try! decimal.calculate(.multiple) // 여기서 에러

        let numArray = decimal.getNumStack()
        
        XCTAssertEqual(numArray, ["-242124289", "3"])
    }
    
    func testBigNegativeDouble() {
        decimal.current = "-242124.2897242"
        try! decimal.calculate(.plus)
        decimal.current = "3"
        try! decimal.calculate(.multiple) // 여기서 에러

        let numArray = decimal.getNumStack()
        
        XCTAssertEqual(numArray, ["-242124.289", "3"])
    }
}
