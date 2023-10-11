//
//  ExtensionTest.swift
//  ExtensionTest
//
//  Created by Lee minyeol on 2023/10/11.
//

import XCTest
@testable import Calculator

final class ExtensionTest: XCTestCase {
    var sut: String?
    
    override func setUpWithError() throws {
        try super.setUpWithError()
        sut = String()
    }

    override func tearDownWithError() throws {
        try super.tearDownWithError()
        sut = nil
    }
    
    func test_문자열을입력했을떄_split실행했을떄_Charcater기준_String새로운배열로_값이나온다() {
        //given
        sut = "0 + 1 + 2"
        //when
        let result = sut?.split(with: "+")
        //then
        XCTAssertTrue((result != nil))
    }
    
}
