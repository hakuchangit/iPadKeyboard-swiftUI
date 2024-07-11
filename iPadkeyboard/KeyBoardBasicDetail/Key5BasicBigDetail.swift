//
//  SwiftUIView.swift
//  iPadkeyboard
//
//  Created by Izumi Kiuchi on 2024/01/27.
//

import SwiftUI

struct Key5BasicBigDetailView: View {
    @EnvironmentObject var keySetting: KeySetting
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
                KeyView(letter: letters[4], keyType: keyTypeBasicBigDetailColor1(keySetting: keySetting), column: column)

                KeyView(letter: "←", keyType: keyTypeBasicBigDetailColor1(keySetting: keySetting), column: column)

            }
            VStack{
                KeyView(letter: letters[2], keyType: keyTypeBasicBigDetailColor2(keySetting: keySetting), column: column)

                KeyView(letter: letters[3], keyType: keyTypeBasicBigDetailColor2(keySetting: keySetting), column: column)

            }
            VStack{
                KeyView(letter: letters[0], keyType: keyTypeBasicBigDetailColor1(keySetting: keySetting), column: column)

                KeyView(letter: letters[1], keyType: keyTypeBasicBigDetailColor1(keySetting: keySetting), column: column)
            }
        }
    }
}

#Preview ("横画面(右)", traits: PreviewTrait.landscapeLeft){
    Key5BasicBigDetailView(letters:["あ","い","う","え","お"], column: 1).environmentObject(KeySetting())
}
