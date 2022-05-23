//
//  splitTests.swift
//  splitTests
//
//  Created by 김동용 on 2022/05/20.
//

import XCTest

class splitTests: XCTestCase {
    var sut: String = ""
    override func setUpWithError() throws {
        try super.setUpWithError()
        sut = "1-2+3*4"
    }

    override func tearDownWithError() throws {
        try super.tearDownWithError()
        sut = ""
    }

    func test_더하기연산자를기준으로_split하면_원하는결과값이나오는가() {
        //when
        sut = "1-2+3+4"
        
        //given 
        let result = sut.split(separator: "+")
        
        //then
        XCTAssertEqual(result, ["1-2", "3", "4"])
        
    }
   
    func test_split을하고_map고차함수를쓰면_결과값이_subString에서_String으로매핑되어서결과를반환하는가() {
        //when
        sut = "1-2+3+4"
        
        //given
        let result = sut.split(separator: "+")
                        .map { String($0) } 
        
        //then
        XCTAssertEqual(result, ["1-2", "3", "4"])
    }

}
