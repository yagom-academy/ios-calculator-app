
import XCTest

@testable import Calculator

class ExpressionParserTests: XCTestCase {

    var successTestCases: [String] = []
    var failureTestCases: [String] = []

    override func setUpWithError() throws {
        failureTestCases.append("+ 123 + 123 + 123 +")
        failureTestCases.append("× 12 + ÷ 123 - -")
        failureTestCases.append("123z")
        failureTestCases.append("12 + + 1")
        
        successTestCases.append("123 + 123 + 123")
        successTestCases.append("12 + 123 - 3 ÷ 1 × 5")
        successTestCases.append("1")
        successTestCases.append("1 ÷ 3")
    }
    
    func test_failureCase() {
        let failureAnswerList: [CalculatorError] = [.firstOrLastComponentIsNotOperand,
                                                          .firstOrLastComponentIsNotOperand,
                                                          .includingAbnormalCharacter,
                                                          .incorrectCountOfOperandsAndOperators]
        
        for index in 0..<failureTestCases.count {
            XCTAssertThrowsError(try ExpressionParser.parse(from: failureTestCases[index])) { error in
                XCTAssertEqual(error as? CalculatorError, failureAnswerList[index])
            }
        }
    }
    
    func test_operatorsTest() {
        let successAnswerList: [[Operator]] =  [[.add, .add],
                                                [.add,.subtract,.divide,.multiply],
                                                [],
                                                [.divide]]

        for index in 0..<successTestCases.count {
            XCTAssertEqual(try ExpressionParser.parse(from: successTestCases[index]).operatorsQueue.allItems(), successAnswerList[index])
        }
    }

    func test_operandsTest() {
        let successAnswerList: [[Double]] =  [[123, 123, 123],
                                       [12,123,3,1,5],
                                       [1],
                                       [1,3]]



        for index in 0..<successTestCases.count {
            XCTAssertEqual(try ExpressionParser.parse(from: successTestCases[index]).operandsQueue.allItems(), successAnswerList[index])
        }
    }
}
