import XCTest

@testable import Calculator

class CalculatorTests: XCTestCase {
    var testQueue: CalculatorItemQueue!
    
    override func setUpWithError() throws {
        try super.setUpWithError()
        testQueue = CalculatorItemQueue()
    }
}
