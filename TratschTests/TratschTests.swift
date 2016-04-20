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
    
    func testTranslateSingleWord() {
        let emoji = tratsch.emoji(forWord: "dog")
        XCTAssert(emoji!.unicode == "🐶")
    }

    func textTranslatePlural() {
        let singularEmoji = tratsch.emoji(forWord: "dog")
        let pluralEmoji   = tratsch.emoji(forWord: "dogs")

        XCTAssert(singularEmoji!.unicode == pluralEmoji!.unicode)
    }

    func testTranslateText() {
        let translatedText = tratsch.translate("I love my cat and your dog")
        print(translatedText)
    }

    func testPerformanceExample() {
        self.measureBlock {
        }
    }
    
}
