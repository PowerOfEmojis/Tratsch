//
//  Tratsch.swift
//  Tratsch
//
//  Created by Thomas Paul Mann on 20.04.16.
//  Copyright © 2016 Power Of Emojis. All rights reserved.
//

import Foundation

class Tratsch {

    var emojis = [Emoji]()

    init() {
        emojis = parse()
    }

    func test() -> [Emoji] {
        return parse()
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