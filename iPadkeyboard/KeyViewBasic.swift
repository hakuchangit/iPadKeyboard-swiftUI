//
//  KeyView.swift
//  iPadkeyboard
//
//  Created by Izumi Kiuchi on 2024/01/27.
//

import SwiftUI
import AVFoundation

struct KeyView: View {
    var letter: String = "あ"

    var keyType:KeyInterface

    var column:Int = 1
    @EnvironmentObject var keySetting: KeySetting
    var keyAction:keyActionEnum = keyActionEnum.sendPC

    var body: some View {
        Button(action: {
            keyType.keyAction(text: letter)
        }, label: {
                Text(letter)
                .foregroundColor(keyType.keyTextColor(colorSwitch: keySetting.keyColorSwitch))
                    .padding(.leading, 1)
                    .font(.system(size: keyType.fontSize, weight: .regular, design: .default))
                    .lineLimit(1)
                    .foregroundColor(.white)
                    .frame(width: keyType.frameWidthSize, height: keyType.frameHeightSize, alignment: .center)
                    .background(keyType.keyColor(colorSwitch: keySetting.keyColorSwitch))
        })
    }
    
//    private func pushKey(text: String){
//        peripheralManager.notify(text: text)
//    }
//    private func speak(text: String) {
//      let utterance = AVSpeechUtterance(string: text)
//      utterance.voice = AVSpeechSynthesisVoice(language: "ja-JP")
//      utterance.rate = 0.3
//      synthesizer.speak(utterance)
//    }
}

#Preview ("横画面(右)", traits: PreviewTrait.landscapeLeft){
    KeyView(keyType: keyType1()).environmentObject(KeySetting())
}
