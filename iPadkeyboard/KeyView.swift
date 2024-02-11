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
    var keyColor:Color = Color.black
    var letterColor:Color = Color.white
    var fontSize:CGFloat = 80
    var frameWidthSize:CGFloat = 100
    var frameHeightSize:CGFloat = 100
    var body: some View {
        Button(action: {
            pushKey(text: letter)
            self.speak(text: letter)
        }, label: {
            Text(letter)
                .foregroundColor(letterColor)
                .padding()
                .font(.system(size: fontSize, weight: .regular, design: .default))
                .foregroundColor(.white)
                .frame(width: frameWidthSize, height: frameHeightSize, alignment: .center)
                .background(keyColor)
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

#Preview ("横画面(右)", traits: PreviewTrait.landscapeLeft){
    KeyView()
}
