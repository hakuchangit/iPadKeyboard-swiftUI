//
//  KeyboardView.swift
//  iPadkeyboard
//
//  Created by Izumi Kiuchi on 2024/01/23.
//

import SwiftUI


struct KeyboardView: View {

    var body: some View {
        VStack{
            HStack{
                HStack{
                    Key5View(letters:["わ","い","を","え","ん"])
                    Key5View(letters:["ら","り","る","れ","ろ"])
                    Key5View(letters:["や","い","ゆ","え","よ"])
                    Key5View(letters:["ま","み","む","め","も"])
                    Key5View(letters:["は","ひ","ふ","へ","ほ"])
                }.padding(.trailing, 10)
                HStack{
                    Key5View(letters:["な","に","ぬ","ね","の"])
                    Key5View(letters:["た","ち","つ","て","と"])
                    Key5View(letters:["さ","し","す","せ","そ"])
                    Key5View(letters:["か","き","く","け","こ"])
                    Key5View(letters:["あ","い","う","え","お"])

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
