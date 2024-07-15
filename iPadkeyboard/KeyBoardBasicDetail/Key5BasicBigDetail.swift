//
//  SwiftUIView.swift
//  iPadkeyboard
//
//  Created by Izumi Kiuchi on 2024/01/27.
//

import SwiftUI

struct Key5BasicBigDetailView: View {
//    @EnvironmentObject var keySetting: KeySetting
//    var column: Int = 0
//    var letters: [String] = ["あ","い","う","え","お"]
//    @State private var keyViews: [KeyView]
    @EnvironmentObject var keySetting: KeySetting
        var column: Int
        @State private var letters: [String] = ["あ", "い", "う", "え", "お"]
        @State private var keyViews: [KeyView] = []
    init(column: Int) {
            self.column = column
        }
//    init(column: Int) {
//        self.column = column
//        _keyViews = State(initialValue: [])
//                for letter in letters {
//                    keyViews.append(KeyView(letter: letter, keyType: keyTypeBasicColor1(), column: column))
//                }
//        }

    var body: some View {
        HStack{
            if keyViews.count == 6 {
                VStack{
                    keyViews[4]
                    keyViews[5]
                }
                VStack{
                    keyViews[2]
                    keyViews[3]
                }
                VStack{
                    keyViews[0]
                    keyViews[1]
                }
            }
        }.onAppear {
            let foundLetters = findHiraganaGroup(letter: keySetting.bigKeyLetter)
            self.letters = foundLetters
            self.keyViews = foundLetters.enumerated().map { (index, letter) in
                if letter == "" {
                    KeyView(letter: letter, keyType: keyTypeBigDetailColor1(keySetting: keySetting), column: self.column)
                }else if index == 2 || index == 3{
                    KeyView(letter: letter, keyType: keyTypeBigDetailColor2(keySetting: keySetting), column: self.column)
                }else{
                    KeyView(letter: letter, keyType: keyTypeBigDetailColor1(keySetting: keySetting), column: self.column)
                }
            }
            self.keyViews.append(KeyView(letter: "←", keyType: keyTypeBigDetailColor1(keySetting: keySetting), column: self.column))
        }
    }
}

#Preview ("横画面(右)", traits: PreviewTrait.landscapeLeft){
    Key5BasicBigDetailView(column: 1).environmentObject(KeySetting())
}
