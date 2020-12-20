
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
}
