//
//  KeyboardView.swift
//  iPadkeyboard
//
//  Created by Izumi Kiuchi on 2024/01/23.
//

import SwiftUI



struct KeyBoardBasicDetailView: View {
    //@ObservedObject var keyColorSwitch = KeyboardColorNumber()
    @EnvironmentObject var keySetting: KeySetting

    var body: some View {
        VStack{
            Button(action: {
                if keySetting.keyColorSwitch == 1{
                    keySetting.keyColorSwitch = 2
                } else {
                    keySetting.keyColorSwitch  = 1
                }
            }) {
                Text("いろへんこう")
                    .font(.title)
                    .frame(width:300, height:40)
                    .foregroundColor(Color.white)
                    .fontWeight(.heavy)
            }
            .background(keySetting.keyColorSwitch  == 1 ? Color.black : Color(red: 0.996, green: 0.345, blue: 0.005, opacity: 1.0))
            .cornerRadius(26)
            .padding(.top,15)
            .padding(.bottom,10)
            HStack{
                HStack{
                    Key5View(column: 10, letters:["わ","empty","を","empty","ん"])
                    Key5View(column: 9, letters:["ら","り","る","れ","ろ"])
                    Key5View(column: 8, letters:["や","?","ゆ","!","よ"])
                    Key5View(column: 7, letters:["ま","み","む","め","も"])
                    Key5View(column: 6, letters:["は","ひ","ふ","へ","ほ"])
                }.padding(.trailing, 10)

                HStack{
                    Key5View(column: 5, letters:["な","に","ぬ","ね","の"])
                    Key5View(column: 4, letters:["た","ち","つ","て","と"])
                    Key5View(column: 3, letters:["さ","し","す","せ","そ"])
                    Key5View(column: 2, letters:["か","き","く","け","こ"])
                    Key5View(column: 1, letters:["あ","い","う","え","お"])
                }
            }

            HStack{
                KeyView(letter:"、", keyType: keyTypeBasicColor1(), column: 2)
                KeyView(letter:"。", keyType: keyTypeBasicColor1(), column: 1)
                KeyView(letter:"決定", keyType: keyTypeBasicLong(), column: 1)
                    .padding([.leading,.trailing], 50)
                KeyView(letter:"゛", keyType: keyTypeBasicColor1(), column: 1)
                KeyView(letter:"゜", keyType: keyTypeBasicColor1(), column: 1)
            }.padding([.top], 10)
        }
    }
}

#Preview ("横画面(右)", traits: PreviewTrait.landscapeLeft){
    BasicKeyboardView().environmentObject(KeySetting())
}

