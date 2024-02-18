//
//  KeyboardView.swift
//  iPadkeyboard
//
//  Created by Izumi Kiuchi on 2024/01/23.
//

import SwiftUI

class KeyboardColorNumber: ObservableObject {
    @Published var colorSwitch: Int = 1
}

struct KeyboardView: View {
    @ObservedObject var colorSwitch = KeyboardColorNumber()

    var body: some View {
        VStack{
            HStack{
                HStack{
                    Key5View(column: 10, letters:["わ","い","を","え","ん"])
                    Key5View(column: 9, letters:["ら","り","る","れ","ろ"])
                    Key5View(column: 8, letters:["や","い","ゆ","え","よ"])
                    Key5View(column: 7, letters:["ま","み","む","め","も"])
                    Key5View(column: 6, letters:["は","ひ","ふ","へ","ほ"])
                }.padding(.trailing, 10)

                HStack{
                    Key5View(column: 5, letters:["な","に","ぬ","ね","の"])
                    Key5View(column: 4, letters:["た","ち","つ","て","と"])
                    Key5View(column: 3, letters:["さ","し","す","せ","そ"])
                    Key5View(column: 2, letters:["か","き","く","け","こ"])
                    Key5View(column: 1, letters:["あ","い","う","え","お"])

                }.padding(.leading, 10)
            }
        }.padding(.top, 60)

        HStack{
            KeyView(letter:"、")
                KeyView(letter:"。")
            KeyView(letter:"決定", frameWidthSize: 220).padding([.leading, .trailing], 220)
                KeyView(letter:"゛")
                KeyView(letter:"゜")
        }.padding(.top, 30)
        Spacer()
    }
}

#Preview ("横画面(右)", traits: PreviewTrait.landscapeLeft){
    KeyboardView()
}
