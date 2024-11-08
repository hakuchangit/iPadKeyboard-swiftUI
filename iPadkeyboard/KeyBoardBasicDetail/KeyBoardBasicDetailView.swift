//
//  KeyboardView.swift
//  iPadkeyboard
//
//  Created by Izumi Kiuchi on 2024/01/23.
//

import SwiftUI



struct KeyBoardBasicDetailView: View {
    @EnvironmentObject var keySetting: KeySetting

    var body: some View {
        VStack{
            if keySetting.keyShowToggle {
                Button(action: {
                    print(keySetting.keyShowToggle)
                    if keySetting.keyColorSwitch == 1{
                        keySetting.keyColorSwitch = 2
                    } else {
                        keySetting.keyColorSwitch  = 1
                    }
                }) {
                    Text("いろへんこう")
                        .font(.largeTitle)
                        .frame(width:300, height:40)
                        .foregroundColor(Color.white)
                        //.fontWeight(.heavy)
                }
                .background(keySetting.keyColorSwitch  == 1 ? Color.black : Color(red: 0.996, green: 0.345, blue: 0.005, opacity: 1.0))
                .cornerRadius(26)
                .padding(.top,15)
                .padding(.bottom,10)
                HStack{
                    HStack{
                        Key5View2(column: 10, letters:["わ","empty","を","empty","ん"])
                        Key5View2(column: 9, letters:["ら","り","る","れ","ろ"])
                        Key5View2(column: 8, letters:["や","empty","ゆ","empty","よ"])
                        Key5View2(column: 7, letters:["ま","み","む","め","も"])
                        Key5View2(column: 6, letters:["は","ひ","ふ","へ","ほ"])
                    }.padding(.trailing, 10)

                    HStack{
                        Key5View2(column: 5, letters:["な","に","ぬ","ね","の"])
                        Key5View2(column: 4, letters:["た","ち","つ","て","と"])
                        Key5View2(column: 3, letters:["さ","し","す","せ","そ"])
                        Key5View2(column: 2, letters:["か","き","く","け","こ"])
                        Key5View2(column: 1, letters:["あ","い","う","え","お"])
                    }
                }

                HStack{
                    KeyView(letter: "゛", keyType: keyTypeBasicDetailColor1(keySetting: keySetting), column: 1)
                    KeyView(letter:"゜", keyType: keyTypeBasicDetailColor2(keySetting: keySetting), column: 1)
                    KeyView(letter:"改", keyType: keyTypeBasicDetailColor1(keySetting: keySetting), column: 1)
                    KeyView(letter:"決定", keyType: keyTypeBasicDetailLong2(keySetting: keySetting), column: 1)
                    KeyView(letter:"変換", keyType: keyTypeBasicDetailLong1(keySetting: keySetting), column: 1)
                    KeyView(letter:"消", keyType: keyTypeBasicDetailColor2(keySetting: keySetting), column: 1)
                    KeyView(letter:"、", keyType: keyTypeBasicDetailColor1(keySetting: keySetting), column: 1)
                    KeyView(letter:"。", keyType: keyTypeBasicDetailColor2(keySetting: keySetting), column: 1)
                }.padding([.top], 10)
        }
            else {
                Key5BasicBigDetailView(column: 0)
            }
        }
    }
}

@available(iOS 17.0, *)
#Preview ("横画面(右)", traits: PreviewTrait.landscapeLeft){
    KeyBoardBasicDetailView().environmentObject(KeySetting())
}

