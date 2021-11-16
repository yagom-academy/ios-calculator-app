
import XCTest

class ExtensionTests: XCTestCase {
    
    override func setUpWithError() throws {
        try super.setUpWithError()
    }
    
    override func tearDownWithError() throws {
        try super.tearDownWithError()
    }
    
    func test_String을Extension한_split을_써서_타겟을_포함한_문자열이_나오는지() {
        let testString = "11+12+13"
        let test = testString.split(with: "+")
        XCTAssertEqual(test, ["11","+","12","+","13"])
    }
    
}
