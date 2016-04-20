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
    private let symbols = "!\"#$%&\'()*+,-./:;<=>?@[]^_`{|}~"
    private var emojis  = [Emoji]()

    init() {
        emojis = parse()
    }

    func emoji(forWord word: String) -> Emoji? {
        assert(!word.characters.contains(" "), "Can not handle mutliple words 💔")

        if word.characters.count < 3 {
            return nil
        }

        for emoji in emojis {
            if emoji.translatable(word) {
                // Yeah, we found something 💪
                return emoji
            }

            // Singular
            if word.characters.last == "s" && emoji.translatable(word.dropLast()) {
                // Yeah, we found something 💪
                return emoji
            }

            // Plural
            if word.characters.last != "s" && emoji.translatable(word + "s") {
                // Yeah, we found something 💪
                return emoji
            }
        }

        // Nothing found 😞
        return nil
    }

    func translate(text: String) -> String {
        var translatedText = ""
        let words = text.characters.split(" ").map(String.init)

        for word in words {
            var lastSymbol: Character?
            var symbolFreeWord = word

            // Handle Symbols
            for symbol in symbols.characters {
                if let firstChar = word.characters.first where firstChar == symbol {
                    symbolFreeWord = word.dropFirst()
                    translatedText.append(symbol)
                }

                if let lastChar = word.characters.last where lastChar == symbol {
                    lastSymbol = symbol
                    symbolFreeWord = word.dropLast()
                }
            }

            // Translate Word
            if let emoji = emoji(forWord: symbolFreeWord) {
                translatedText.appendContentsOf(emoji.unicode)
            } else {
                translatedText.appendContentsOf(symbolFreeWord)
            }

            // Append symbols
            if lastSymbol != nil {
                translatedText.append(lastSymbol!)
            }

            // Append whitespace
            if word != words.last {
                translatedText.appendContentsOf(" ")
            }
        }

        return translatedText
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