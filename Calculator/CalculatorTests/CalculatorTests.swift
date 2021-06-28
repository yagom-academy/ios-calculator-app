@testable import Calculator
import XCTest

class CalculatorTests: XCTestCase {
    let sut = Calculator()
    
    func test_1plus2plus3() {
        sut.replaceInfix(with: ["1", "+", "2", "+", "3"])
        XCTAssertEqual(try sut.calculate(), 6)
    }
    
    func test_1times2times3() {
        sut.replaceInfix(with: ["1", "*", "2", "*", "3"])
        XCTAssertEqual(try sut.calculate(), 6)
    }
    
    func test_1minus2minus3() {
        sut.replaceInfix(with: ["1", "-", "2", "-", "3"])
        XCTAssertEqual(try sut.calculate(), -4)
    }
    
    func test_1divide2divide3() {
        sut.replaceInfix(with: ["1", "/", "2", "/", "3"])
        XCTAssertEqual(try sut.calculate(), 0.16667)
    }
}
