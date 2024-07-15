//
//  SwiftUIView.swift
//  iPadkeyboard
//
//  Created by Izumi Kiuchi on 2024/01/27.
//

import SwiftUI

struct Key5View: View {
    var column: Int = 0
    var letters:[String] = ["あ","い","う","え","お"]

    var body: some View {
        VStack{
            ForEach(letters.map { IdentifiableLetter(value: $0) }) { letter in
                if letter.value == "empty" {
                    KeyView(letter: letter.value, keyType: keyTypeBasicEmpty(), column: column)
                } else if column % 2 == 0 {
                    KeyView(letter: letter.value, keyType: keyTypeBasicColor1(), column: column)
                } else {
                    KeyView(letter: letter.value, keyType: keyTypeBasicColor2(), column: column)
                }
            }
        }
    }
}

#Preview ("横画面(右)", traits: PreviewTrait.landscapeLeft){
    Key5View(column: 1, letters:["あ","い","う","え","お"]).environmentObject(KeySetting())
}

struct IdentifiableLetter: Identifiable {
    let id = UUID()
    let value: String
}
