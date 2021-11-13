import XCTest

class ExpressionParserUnitTest: XCTestCase {
    
    override func setUpWithError() throws {
        
    }

    override func tearDownWithError() throws {
        
    }
    
    func test_더하기_연산자_기준으로_잘_나눠지는지() {
        let splitedArray = "1+2+3".split(with: "+")

        XCTAssertEqual(splitedArray, ["1 2 3"])
    }
    
    func test_더하기_빼기가_있는_문자열이_더하기로_잘_나눠지는지() {
        let splitedArray = "1+2-3".split(with: "+")

        XCTAssertEqual(splitedArray, ["1 2-3"])
    }
    
    func test_더하기_빼기_곱하기_나누기가_있는_문자열에서_숫자만_뽑아지는지() {
        let inputString = "1+2-3*4/5"
        let result = ExpressionParser.componentsByOperators(from: inputString)
        
        XCTAssertEqual(result, (["1","2","3","4","5"]))
    }
    
    func test_더하기_빼기_곱하기_나누기가_있는_문자열에서_연산자만_뽑아지는지() {
        let inputString = "1+2-3*4/5"
        let result = ExpressionParser.parse(from: inputString)
        
        XCTAssertEqual(result, (["+","-","*","/"]))
    }
}
