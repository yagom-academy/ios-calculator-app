import XCTest
@testable import Calculator

class FormulaTests: XCTestCase {
    var sut: Formula!

    override func setUpWithError() throws {
        try super.setUpWithError()
        sut = Formula()
    }

    override func tearDownWithError() throws {
        try super.tearDownWithError()
        sut = nil
    }
    
    func test_Formula_빈_result() {
        let result = try? sut.result()
        XCTAssertEqual(result, 0)
    }
    
    func test_Formula_1더하기2는3() {
        sut.operandQueue.enqueue(1)
        sut.operatorQueue.enqueue(Operator.add)
        sut.operandQueue.enqueue(2)
        
        let result = try? sut.result()
        XCTAssertEqual(result, 3)
    }
    
    func test_Formula_오퍼레이터가_하나_남는_경우_무시() {
        sut.operandQueue.enqueue(1)
        sut.operatorQueue.enqueue(Operator.add)
        sut.operandQueue.enqueue(2)
        sut.operatorQueue.enqueue(Operator.add)
        
        let result = try? sut.result()
        XCTAssertEqual(result, 3)
    }
    
    func test_Formula_오퍼레이터가_없으면_첫번째_숫자가_result() {
        sut.operandQueue.enqueue(1)
        sut.operandQueue.enqueue(2)
        
        let result = try? sut.result()
        XCTAssertEqual(result, 1)
    }
}
