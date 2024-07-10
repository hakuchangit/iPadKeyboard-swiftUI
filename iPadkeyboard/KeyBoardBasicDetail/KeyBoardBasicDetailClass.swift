//
//  KeyBoardBasicDetailClass.swift
//  iPadkeyboard
//
//  Created by Izumi Kiuchi on 2024/07/10.
//

import Foundation
import UIKit
import SwiftUI
import AVFoundation


class keyTypeBasicDetailColor1: KeyInterface{
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
    var fontSize:CGFloat = 300
    var frameWidthSize:CGFloat = 350
    var frameHeightSize:CGFloat = 350
}

class keyTypeBasicDetailColor2: KeyInterface{
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
    var fontSize:CGFloat = 300
    var frameWidthSize:CGFloat = 350
    var frameHeightSize:CGFloat = 350
}
