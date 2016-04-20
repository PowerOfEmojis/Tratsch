//
//  StringExtension.swift
//  Tratsch
//
//  Created by Thomas Paul Mann on 20.04.16.
//  Copyright © 2016 Power Of Emojis. All rights reserved.
//

extension String {

    func removeLastCharacter() -> String {
        return substringToIndex(characters.endIndex.advancedBy(-1))
    }

}