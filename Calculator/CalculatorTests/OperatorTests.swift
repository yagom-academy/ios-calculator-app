import XCTest

class OperatorTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func test_Operator의_add_case에_1과2를_넣으면_3이_반환된다() {
        let calculator = Operator(rawValue: "+")
        let result = calculator?.calculate(lhs: 1, rhs: 2)
        XCTAssertEqual(result, 3)
    }


}
