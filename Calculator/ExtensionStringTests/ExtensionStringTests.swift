import XCTest

final class ExtensionStringTests: XCTestCase {
    
    func test_숫자와부호가섞여서들어있을때_숫자값만을_반환하는지_확인(){
        // given
        let inputValue = "1+2+3+4+5"
        
        // when
        let split = inputValue.split(with: "+")
        let expectedValue = ["1","2","3","4","5"]
        
        // then
        XCTAssertEqual(split, expectedValue)
    }

}
