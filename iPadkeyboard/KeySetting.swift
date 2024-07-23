//
//  Setting.swift
//  iPadkeyboard
//
//  Created by Izumi Kiuchi on 2024/06/04.
//

import Foundation
import UIKit
import SwiftUI
import AVFoundation

class KeySetting: ObservableObject{
    @Published var keyColorSwitch = 1
    @Published var keyShowToggle = true
    @Published var bigKeyLetter = "あ"
}
enum keyActionEnum{
    case sendPC
    case transition
}

protocol KeyInterface{
    var keyColor1:Color { get }
    var keyColor2:Color { get }
    var fontSize:CGFloat { get }
    var frameWidthSize:CGFloat { get}
    var frameHeightSize:CGFloat { get}
    func keyAction(text: String)
    func keyColor(colorSwitch: Int) -> Color
    func keyTextColor(colorSwitch: Int) -> Color
}


let orange = Color(red: 0.996, green: 0.345, blue: 0.005, opacity: 1.0)
let blue = Color(red: 25/255.0, green: 23/255.0, blue: 138/255.0)
let gray = Color(red: 168/255.0, green: 168/255.0, blue: 168/255.0)
class keyTypeBasicColor1: KeyInterface{
    func keyTextColor(colorSwitch: Int) -> Color {
        return colorSwitch == 1 ? self.keyTextColor1 : self.keyTextColor2
    }
    
    func keyColor(colorSwitch: Int) -> Color {
        return colorSwitch == 1 ? self.keyColor1 : self.keyColor2
    }
    
    func keyAction(text: String) {
        pushKey(text: text)
        speak(text: text)
    }

    var keyColor1:Color = blue
    var keyColor2:Color = .black
    var keyTextColor1:Color = .white
    var keyTextColor2:Color = .white
    var fontSize:CGFloat = 80
    var frameWidthSize:CGFloat = 100
    var frameHeightSize:CGFloat = 100
}

class keyTypeBasicColor2: KeyInterface{
    func keyTextColor(colorSwitch: Int) -> Color {
        return colorSwitch == 1 ? self.keyTextColor1 : self.keyTextColor2
    }

    func keyColor(colorSwitch: Int) -> Color {
        return colorSwitch == 1 ? self.keyColor1 : self.keyColor2
    }

    func keyAction(text: String) {
        pushKey(text: text)
        speak(text: text)
    }

    var keyColor1:Color = orange
    var keyColor2:Color = gray
    var keyTextColor1:Color = .white
    var keyTextColor2:Color = .white
    var fontSize:CGFloat = 80
    var frameWidthSize:CGFloat = 100
    var frameHeightSize:CGFloat = 100
}


class keyTypeBasicLong1: KeyInterface{
    func keyTextColor(colorSwitch: Int) -> Color {
        return colorSwitch == 1 ? self.keyTextColor1 : self.keyTextColor2
    }
    
    func keyColor(colorSwitch: Int) -> Color {
        return colorSwitch == 1 ? self.keyColor1 : self.keyColor2
    }
    
    func keyAction(text: String) {
        pushKey(text: text)
        speak(text: text)
    }
    
    var keyColor1:Color = blue
    var keyColor2:Color = .black
    var keyTextColor1:Color = .white
    var keyTextColor2:Color = .white
    var fontSize:CGFloat = 80
    var frameWidthSize:CGFloat = 220
    var frameHeightSize:CGFloat = 100
}

class keyTypeBasicLong2: KeyInterface{
    func keyTextColor(colorSwitch: Int) -> Color {
        return colorSwitch == 1 ? self.keyTextColor1 : self.keyTextColor2
    }

    func keyColor(colorSwitch: Int) -> Color {
        return colorSwitch == 1 ? self.keyColor1 : self.keyColor2
    }

    func keyAction(text: String) {
        pushKey(text: text)
        speak(text: text)
    }

    var keyColor1:Color = orange
    var keyColor2:Color = gray
    var keyTextColor1:Color = .white
    var keyTextColor2:Color = .white
    var fontSize:CGFloat = 80
    var frameWidthSize:CGFloat = 220
    var frameHeightSize:CGFloat = 100
}

class keyTypeBasicEmpty: KeyInterface{
    func keyTextColor(colorSwitch: Int) -> Color {
        return Color.clear
    }
    
    func keyColor(colorSwitch: Int) -> Color {
        return Color.clear
    }
    
    func keyAction(text: String) {
    }
    
    var keyColor1:Color = Color.clear
    var keyColor2:Color = Color.clear
    var fontSize:CGFloat = 80
    var frameWidthSize:CGFloat = 100
    var frameHeightSize:CGFloat = 100
}

func pushKey(text: String){
    peripheralManager.notify(text: text)
    print("PUSH KEY")
}

func speak(text: String) {
 let speakText = speakText(text: text)
  let utterance = AVSpeechUtterance(string: speakText)
  utterance.voice = AVSpeechSynthesisVoice(language: "ja-JP")
  utterance.rate = 0.3
  synthesizer.speak(utterance)

}

func speakText(text: String) -> String{
    if(text == "B"){
        return "バックスペース"
    }
    if(text == "←"){
        return "戻る"
    }
    if(text == "゛"){
        return "濁点"
    }
    if(text == "゜"){
        return "半濁点"
    }
    if(text == "。"){
        return "句点"
    }
    if(text == "、"){
        return "読点"
    }


return text

}
