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
    
    func test_Operator의_subtract_case에_1과2를_넣으면_마이너스1이_반환된다() {
        let calculator = Operator(rawValue: "-")
        let result = calculator?.calculate(lhs: 1, rhs: 2)
        XCTAssertEqual(result, -1)
    }
    
    func test_Operator의_divide_case에_1과2를_넣으면_소수0점5가_반환된다() {
        let calculator = Operator(rawValue: "/")
        let result = calculator?.calculate(lhs: 1, rhs: 2)
        XCTAssertEqual(result, 0.5)
    }
    
    func test_Operator의_multiply_case에_2와3을_넣으면_6이_반환된다() {
        let calculator = Operator(rawValue: "*")
        let result = calculator?.calculate(lhs: 2, rhs: 3)
        XCTAssertEqual(result, 6)
    }


}
