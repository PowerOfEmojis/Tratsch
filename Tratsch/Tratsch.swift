//
//  Tratsch.swift
//  Tratsch
//
//  Created by Thomas Paul Mann on 20.04.16.
//  Copyright © 2016 Power Of Emojis. All rights reserved.
//

import Foundation

typealias Payload = [AnyObject]
typealias JSON    = [String : AnyObject]

class Tratsch {

    var emojis = [Emoji]()

    init() {
        emojis = parse()
    }

    func emoji(forWord word: String) -> Emoji? {
        assert(!word.characters.contains(" "), "Can not handle mutliple words 💔")

        for emoji in emojis {
            if emoji.name == word.lowercaseString || emoji.keywords.contains(word.lowercaseString) {
                // Yeah, we found something 💪
                return emoji
            }
        }

        // Nothing found 😞
        return nil
    }

}

// MARK: Parsing

extension Tratsch {

    func parse() -> [Emoji] {
        var emojis = [Emoji]()

        if let json = payload() {
            for item in json {
                if let json = item as? JSON, let emoji = Emoji(withJSON: json) {
                    emojis.append(emoji)
                }
            }
        }

        return emojis
    }

    func payload() -> Payload? {
        if let bundle = NSBundle(identifier: "com.powerofemojis.Tratsch"), let data = NSDataAsset(name: "emojis", bundle: bundle)?.data {
            return try? NSJSONSerialization.JSONObjectWithData(data, options: .AllowFragments) as! Payload
        } else {
            return nil
        }
    }

}