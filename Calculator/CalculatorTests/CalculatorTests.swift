
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
}
