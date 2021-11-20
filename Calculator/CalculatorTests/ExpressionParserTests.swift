
import XCTest

@testable import Calculator

class ExpressionParserTests: XCTestCase {

    var successTestCases: [String] = []
    var failureTestCases: [String] = []
    
    override func setUpWithError() throws {
        failureTestCases.append("+ 123 + 123 + 123 +")
        failureTestCases.append("* 12 + / 123 - -")
        failureTestCases.append("123z")
        failureTestCases.append("12 + + 1")
        
        successTestCases.append("123 + 123 + 123")
        successTestCases.append("12 + 123 - 3 / 1 * 5")
        successTestCases.append("1")
        successTestCases.append("1 / 3")
    }
    
    func test_failureCase() {
        let failureAnswerList: [ExpressionParser.ParserError] = [.firstOrLastComponentIsNotOperand,
                                                          .firstOrLastComponentIsNotOperand,
                                                          .includingAbnormalCharacter,
                                                          .incorrectCountOfOperandsAndOperators]
        
        for index in 0..<failureTestCases.count {
            let failureResult = ExpressionParser.parse(from: failureTestCases[index])
            
            switch failureResult {
            case .failure(let error):
                XCTAssertEqual(error, failureAnswerList[index])
            default:
                break
            }
        }
    }
    
    func test_operandsTest() {
        let successAnswerList: [[Operator]] =  [[.add, .add],
                                                [.add,.subtract,.divide,.multiply],
                                                [],
                                                [.divide]]
        
        for index in 0..<successTestCases.count {
            let successResult = ExpressionParser.parse(from: successTestCases[index])
            
            switch successResult {
            case .success(let formula):
                XCTAssertEqual(formula.operatorsQueue.allOperators(), successAnswerList[index])
            default:
                break
            }
        }
    }
    
    func test_operatorsTest() {
        let successAnswerList: [[Double]] =  [[123, 123, 123],
                                       [12,123,3,1,5],
                                       [1],
                                       [1,3]]
        
        
        
        for index in 0..<successTestCases.count {
            let successResult = ExpressionParser.parse(from: successTestCases[index])
            
            switch successResult {
            case .success(let formula):
                XCTAssertEqual(formula.operandsQueue.allOperands(), successAnswerList[index])
            default:
                break
            }
        }
    }
}
