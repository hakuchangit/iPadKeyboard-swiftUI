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

    var keyColor1:Color = .blue
    var keyColor2:Color = Color(red: 0.996, green: 0.345, blue: 0.005, opacity: 1.0)
    var keyTextColor1:Color = .black
    var keyTextColor2:Color = .black
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

    var keyColor1:Color = Color(red: 0.996, green: 0.345, blue: 0.005, opacity: 1.0)
    var keyColor2:Color = .blue
    var keyTextColor1:Color = .black
    var keyTextColor2:Color = .black
    var fontSize:CGFloat = 80
    var frameWidthSize:CGFloat = 100
    var frameHeightSize:CGFloat = 100
}


class keyTypeBasicLong: KeyInterface{
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
    
    var keyColor1:Color = Color(red: 0.996, green: 0.345, blue: 0.005, opacity: 1.0)
    var keyColor2:Color = .blue
    var keyTextColor1:Color = .black
    var keyTextColor2:Color = .black
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
    //peripheralManager.notify(text: text)
    print("PUSH KEY")
}

func speak(text: String) {
//  let utterance = AVSpeechUtterance(string: text)
//  utterance.voice = AVSpeechSynthesisVoice(language: "ja-JP")
//  utterance.rate = 0.3
//  synthesizer.speak(utterance)
    print("Speaker")
}
