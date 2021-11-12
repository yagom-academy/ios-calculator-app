import XCTest

class ExpressionParserUnitTest: XCTestCase {
    
    override func setUpWithError() throws {
        
    }

    override func tearDownWithError() throws {
        
    }
    
    func test_더하기_연산자_기준으로_잘_나눠지는지() {
        let splitedArray = "1+2+3".split(with: "+")

        XCTAssertEqual(splitedArray, ["1","2","3"])
    }
    
    func test_더하기_빼기가_있는_문자열이_더하기로_잘_나눠지는지() {
        let splitedArray = "1+2-3".split(with: "+")

        XCTAssertEqual(splitedArray, ["1","2-3"])
    }
}
