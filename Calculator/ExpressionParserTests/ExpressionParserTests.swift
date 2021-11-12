import XCTest

class ExpressionParserTests: XCTestCase {
    var sut: ExpressionParser.Type! = ExpressionParser.self
    
    func test_1더하기2곱하기3_을_했을_경우_피연산큐에_123_저장() {
        var formula = Formula()
        formula = sut.parse(from: "1+2*3")
        
        var formulaQueueArr = [Double]()
        formulaQueueArr.append(formula.operands.linkedList.head!.nodeValue)
        formulaQueueArr.append(formula.operands.linkedList.head!.pointer!.nodeValue)
        formulaQueueArr.append(formula.operands.linkedList.head!.pointer!.pointer!.nodeValue)
        
        var testArr: [Double] = [1, 2, 3]
        XCTAssertEqual(formulaQueueArr, testArr)
    }
    
    func test_1더하기2곱하기3을_하면_연산큐에_더하기곱하기_기호_저장() {
        var formula = Formula()
        formula = sut.parse(from: "1+2*3")
        
        var formulaQueueArr = [Character]()
        formulaQueueArr.append(formula.operators.linkedList.head!.nodeValue)
        formulaQueueArr.append(formula.operators.linkedList.head!.pointer!.nodeValue)

        var testArr: [Character] = ["+", "*"]
        XCTAssertEqual(formulaQueueArr, testArr)
    }
}
