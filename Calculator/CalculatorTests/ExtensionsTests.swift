import XCTest

class ExtensionsTests: XCTestCase {
    var sut: String!

    override func setUpWithError() throws {
        sut = ""
    }

    override func tearDownWithError() throws {
        sut = nil
    }

    func test_123더하기456을_더하기기호로_split하면_배열이_반환된다() {
        sut = "123+456"
        let result = sut.split(with: "+")
        XCTAssertEqual(result, ["123", "456"])
    }
    
    func test_1더하기2더하기3더하기4를_더하기기호로_split하면_배열이_반환된다() {
        sut = "1+2+3+4"
        let result = sut.split(with: "+")
        XCTAssertEqual(result, ["1", "2", "3", "4"])
    }
    
    func test_sampleString을_슬래쉬기호로_split하면_배열이_반환된다() {
        sut = "1/2-3*4"
        let result = sut.split(with: "/")
        XCTAssertEqual(result, ["1", "2-3*4"])
    }
}
