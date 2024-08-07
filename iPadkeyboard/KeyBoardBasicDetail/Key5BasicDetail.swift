//
//  SwiftUIView.swift
//  iPadkeyboard
//
//  Created by Izumi Kiuchi on 2024/01/27.
//

import SwiftUI

struct Key5BasicDetailView: View {
    var column: Int = 0
    var letters: [String] = ["あ","い","う","え","お"]
    @State private var keyViews: [KeyView]
    init(letters: [String], column: Int) {
            self.letters = letters
            self.column = column
        _keyViews = State(initialValue: [])
                for letter in letters {
                    keyViews.append(KeyView(letter: letter, keyType: keyTypeBasicColor1(), column: column))
                }
        }

    var body: some View {
        HStack{
            VStack{
                KeyView(letter: letters[4], keyType: keyTypeBasicDetailColor1(), column: column)

                KeyView(letter: "←", keyType: keyTypeBasicDetailColor1(), column: column)

            }
            VStack{
                KeyView(letter: letters[2], keyType: keyTypeBasicDetailColor2(), column: column)

                KeyView(letter: letters[3], keyType: keyTypeBasicDetailColor2(), column: column)

            }
            VStack{
                KeyView(letter: letters[0], keyType: keyTypeBasicDetailColor1(), column: column)

                KeyView(letter: letters[1], keyType: keyTypeBasicDetailColor1(), column: column)
            }
        }
    }
}

#Preview ("横画面(右)", traits: PreviewTrait.landscapeLeft){
    Key5BasicDetailView(letters:["あ","い","う","え","お"], column: 1).environmentObject(KeySetting())
}
