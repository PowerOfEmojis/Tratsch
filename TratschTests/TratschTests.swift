//
//  TratschTests.swift
//  TratschTests
//
//  Created by Thomas Paul Mann on 20.04.16.
//  Copyright © 2016 Power Of Emojis. All rights reserved.
//

import XCTest
@testable import Tratsch

class TratschTests: XCTestCase {

    let tratsch = Tratsch()
    
    func testExample() {
        let emoji = tratsch.emoji(forWord: "dog")
        XCTAssert(emoji!.unicode == "🐶")
    }

    func testPerformanceExample() {
        self.measureBlock {
        }
    }
    
}
