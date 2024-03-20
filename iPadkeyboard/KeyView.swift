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
    var fontSize:CGFloat = 80
    var frameWidthSize:CGFloat = 100
    var frameHeightSize:CGFloat = 100
    var column:Int = 1
    let keyColors: [KeyColor] = [.type1, .type2]
    @ObservedObject var keyColorSwitch: KeyboardColorNumber

    var body: some View {
        Button(action: {
            pushKey(text: letter)
            speaker(text: letter)
        }, label: {
            if letter == "?" || letter == "!"{
                Text("")
                    .foregroundColor(Color.clear)
                    .padding()
                    .font(.system(size: fontSize, weight: .regular, design: .default))
                    .foregroundColor(.white)
                    .frame(width: frameWidthSize, height: frameHeightSize, alignment: .center)
                    .background(Color.clear)

            } else{
                Text(letter)
                    .foregroundColor(keyColors[keyColorSwitch.colorSwitch].letterColor(column: column))
                    .padding(.leading, 1)
                    .font(.system(size: fontSize, weight: .regular, design: .default))
                    .foregroundColor(.white)
                    .frame(width: frameWidthSize, height: frameHeightSize, alignment: .center)
                    .background(keyColors[keyColorSwitch.colorSwitch].keyColor(column: column))
            }
        })
    }
    
    private func pushKey(text: String){
        peripheralManager.notify(text: text)
    }
    private func speak(text: String) {
      let utterance = AVSpeechUtterance(string: text)
      utterance.voice = AVSpeechSynthesisVoice(language: "ja-JP")
      utterance.rate = 0.3
      synthesizer.speak(utterance)
    }
}

//#Preview ("横画面(右)", traits: PreviewTrait.landscapeLeft){
//    KeyView()
//}
