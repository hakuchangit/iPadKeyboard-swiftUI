//
//  TranslateTextToLine.swift
//  iPadkeyboard
//
//  Created by Izumi Kiuchi on 2024/07/15.
//

import Foundation
let hiraganaData: [String: [String]] = [
    "あ行": ["あ","い","う","え","お"],
    "か行" : ["か", "き", "く", "け", "こ"],
    "さ行" : ["さ", "し", "す", "せ", "そ"],
    "た行" : ["た", "ち", "つ", "て", "と"],
    "な行" : ["な", "に", "ぬ", "ね", "の"],
    "は行" : ["は", "ひ", "ふ", "へ", "ほ"],
    "ま行" : ["ま", "み", "む", "め", "も"],
    "や行" : ["や", "ゆ", "よ"],
    "ら行" : ["ら", "り", "る", "れ", "ろ"],
    "わ行" : ["わ", "を", "ん"],
]

func findHiraganaGroup(letter: String) -> [String] {
  for (key, values) in hiraganaData {
      if values.contains(letter) {
          return values
      }
  }
    return ["あ","い","う","え","お"]
}