//
//  Emoji.swift
//  Emojizer
//
//  Created by Thomas Paul Mann on 19.04.16.
//  Copyright © 2016 Power Of Emojis. All rights reserved.
//

import Foundation

struct Emoji {

    let name:      String
    let unicode:   String
    let category:  String
    let keywords: [String]

    init?(withJSON json: JSON) {
        guard
            let name     = json["name"]     as? String,
            let unicode  = json["unicode"]  as? String,
            let category = json["category"] as? String,
            let keywords = json["keywords"] as? [String]
        else {
            print("Error in parsing Emoji")
            return nil
        }

        self.name     = name
        self.unicode  = unicode
        self.category = category
        self.keywords = keywords
    }

    func translatable(word: String) -> Bool {
        return name == word.lowercaseString || keywords.contains(word.lowercaseString)
    }
}
