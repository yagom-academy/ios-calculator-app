@testable import Calculator
import XCTest

class CalculatorTests: XCTestCase {
    var sut: Calculator?
    
    override func setUp() {
        sut = Calculator()
    }
    
    func test_1plus2plus3() {
        sut?.replaceInfix(with: ["1", "+", "2", "+", "3"])
        XCTAssertEqual(try sut?.format(for: sut?.calculate()), "6")
    }
    
    func test_1times2times3() {
        sut?.replaceInfix(with: ["1", "*", "2", "*", "3"])
        XCTAssertEqual(try sut?.format(for: sut?.calculate()), "6")
    }

    func test_1minus2minus3() {
        sut?.replaceInfix(with: ["1", "-", "2", "-", "3"])
        XCTAssertEqual(try sut?.format(for: sut?.calculate()), "-4")
    }

    func test_1divide2divide3() {
        sut?.replaceInfix(with: ["1", "/", "2", "/", "3"])
        XCTAssertEqual(try sut?.format(for: sut?.calculate()), "0.16667")
    }

    func test_1times3plus2divide2() {
        sut?.replaceInfix(with: ["1", "*", "3", "+", "2", "/", "2"])
        XCTAssertEqual(try sut?.format(for: sut?.calculate()), "4")
    }

    func test_1times3plus2divide0() {
        sut?.replaceInfix(with: ["1", "*", "3", "+", "2", "/", "0"])
        XCTAssertEqual(try sut?.format(for: sut?.calculate()), "NaN")
    }

    func test_10dot1plus12dot5divide125plus8minus100times13dot8() {
        sut?.replaceInfix(with: ["10.1", "+", "12.5", "/", "125", "+", "8", "-", "100", "*", "13.8"])
        XCTAssertEqual(try sut?.format(for: sut?.calculate()), "-1,361.8")
    }
}
