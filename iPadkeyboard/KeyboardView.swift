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
    @ObservedObject var keyColorSwitch = KeyboardColorNumber()

    var body: some View {
        VStack{
            Button(action: {
                if keyColorSwitch.colorSwitch == 1{
                    keyColorSwitch.colorSwitch = 0
                } else {
                    keyColorSwitch.colorSwitch = 1
                }
            }) {
                Text("いろへんこう")
                    .font(.title)
                    .frame(width:300, height:40)
                    .foregroundColor(Color.white)
                    .fontWeight(.heavy)
            }
            .background(keyColorSwitch.colorSwitch == 0 ? Color.black : Color(red: 0.996, green: 0.345, blue: 0.005, opacity: 1.0))
            .cornerRadius(26)
            .padding(.top,15)
            .padding(.bottom,10)
            HStack{
                HStack{
                    Key5View(column: 10, letters:["わ","?","を","!","ん"], keyColorSwitch: keyColorSwitch)
                    Key5View(column: 9, letters:["ら","り","る","れ","ろ"], keyColorSwitch: keyColorSwitch)
                    Key5View(column: 8, letters:["や","?","ゆ","!","よ"], keyColorSwitch: keyColorSwitch)
                    Key5View(column: 7, letters:["ま","み","む","め","も"], keyColorSwitch: keyColorSwitch)
                    Key5View(column: 6, letters:["は","ひ","ふ","へ","ほ"], keyColorSwitch: keyColorSwitch)
                }.padding(.trailing, 10)

                HStack{
                    Key5View(column: 5, letters:["な","に","ぬ","ね","の"], keyColorSwitch: keyColorSwitch)
                    Key5View(column: 4, letters:["た","ち","つ","て","と"], keyColorSwitch: keyColorSwitch)
                    Key5View(column: 3, letters:["さ","し","す","せ","そ"], keyColorSwitch: keyColorSwitch)
                    Key5View(column: 2, letters:["か","き","く","け","こ"], keyColorSwitch: keyColorSwitch)
                    Key5View(column: 1, letters:["あ","い","う","え","お"], keyColorSwitch: keyColorSwitch)

                }.padding(.leading, 15)
            }
        }.padding(.bottom, 15)

        HStack{
            KeyView(letter:"、", column: 2, keyColorSwitch: keyColorSwitch)
            KeyView(letter:"。", column: 1, keyColorSwitch: keyColorSwitch)
            KeyView(letter:"決定", frameWidthSize: 220, column: 1, keyColorSwitch: keyColorSwitch).padding([.leading, .trailing], 220)
            KeyView(letter:"゛", column: 2, keyColorSwitch: keyColorSwitch)
            KeyView(letter:"゜", column: 1, keyColorSwitch: keyColorSwitch)
        }.padding([.top, .bottom], 1)
        Spacer()
            .padding(.bottom, 10)
    }
}

#Preview ("横画面(右)", traits: PreviewTrait.landscapeLeft){
    KeyboardView()
}
