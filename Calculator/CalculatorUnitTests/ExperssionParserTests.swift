import XCTest

class ExperssionParserTests: XCTestCase {
    var sut: ExpressionParser.Type!
    
    override func setUpWithError() throws {
        sut = ExpressionParser.self
    }

    override func tearDownWithError() throws {
        sut = nil
    }
        
    func test_수식을_입력했을때_Formula_operands큐에_올바르게_들어가는가() {
        // given
        let input = "1+2−3÷4×5"
        
        // when
        var formula = sut.parse(from: input)
        var result: [Double?] = []
        while formula.operands.numberOfItems > 0 {
            let number = formula.operands.dequeue()
            result.append(number)
        }
        
        // then
        XCTAssertEqual(result, [1, 2, 3, 4, 5])
    }
    
    func test_수식을_입력했을때_Formula_operators큐에_올바르게_들어가는가() {
        // given
        let input = "1+2−3×4÷5"
        
        // when
        var formula = sut.parse(from: input)
        var result: [Operator?] = []
        while formula.operators.numberOfItems > 0 {
            let `operator` = formula.operators.dequeue()
            result.append(`operator`)
        }
        
        // then
        XCTAssertEqual(result, [.add, .subtract, .multiply, .divide])
    }
    
    func test_수식을_입력했을때_Formula_result함수의_결과가_올바르게_나오는가() {
        // given
        let input = "1+2−1×4÷5"
        
        // when
        var formula = sut.parse(from: input)
        let result = formula.result()
        
        // then
        XCTAssertEqual(result, 1.6)
    }
    
    func test_수식중에_0으로_나누는곳이_있다면_NaN를_던지는가() {
        // given
        let input = "1+2−1÷0×5"
        
        // when
        var formula = sut.parse(from: input)
        
        // then
        let result = formula.result()
        XCTAssertTrue(result.isNaN)
    }
}
