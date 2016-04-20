//
//  StringExtension.swift
//  Tratsch
//
//  Created by Thomas Paul Mann on 20.04.16.
//  Copyright © 2016 Power Of Emojis. All rights reserved.
//

extension String {

    func dropLast() -> String {
        return String(characters.dropLast())
    }

    func dropFirst() -> String {
        return String(characters.dropFirst())
    }

}