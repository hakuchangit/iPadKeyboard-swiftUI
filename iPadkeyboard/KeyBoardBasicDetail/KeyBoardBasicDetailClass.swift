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


class keyTypeBasicDetailColor1: keyTypeBasicColor1{
    var keySetting: KeySetting
    init(keySetting: KeySetting) {
        self.keySetting = keySetting
    }
    override
    func keyAction(text: String) {
        self.keySetting.bigKeyLetter = text
        //pushKey(text: text)
        speak(text: text)
        updateKeyShowToggle(text: text)
    }
    private func updateKeyShowToggle(text: String) {
            keySetting.keyShowToggle.toggle()
            keySetting.bigKeyLetter = text
        }
}


class keyTypeBasicDetailColor2: keyTypeBasicColor2{
    var keySetting: KeySetting
    init(keySetting: KeySetting) {
        self.keySetting = keySetting
    }
    override
    func keyAction(text: String) {
        self.keySetting.bigKeyLetter = text
        //pushKey(text: text)
        speak(text: text)
        updateKeyShowToggle(text: text)
    }
    private func updateKeyShowToggle(text: String) {
            keySetting.keyShowToggle.toggle()
            keySetting.bigKeyLetter = text
        }
}



class keyTypeBigDetailColor1: keyTypeBasicColor1{
    var keySetting: KeySetting
    init(keySetting: KeySetting) {
        self.keySetting = keySetting
    }

    override func keyAction(text: String) {
        if text == "←" {
            updateKeyShowToggle(text: text)
        } else{
            pushKey(text: text)
            speak(text: text)
        }
    }
    private func updateKeyShowToggle(text: String) {
        keySetting.keyShowToggle.toggle()
    }

    override var fontSize: CGFloat {
            get {
                return 300
            }
            set {}
        }
    override var frameWidthSize: CGFloat {
            get {
                return 350
            }
            set {}
        }

        override var frameHeightSize: CGFloat {
            get {
                return 350
            }
            set {}
        }
}

class keyTypeBigDetailColor2: keyTypeBasicColor2{
    var keySetting: KeySetting
    init(keySetting: KeySetting) {
        self.keySetting = keySetting
    }

    override func keyAction(text: String) {
        if text == "←" {
            updateKeyShowToggle(text: text)
        } else{
            pushKey(text: text)
            speak(text: text)
        }
    }
    private func updateKeyShowToggle(text: String) {
        keySetting.keyShowToggle.toggle()
    }
    override var fontSize: CGFloat {
            get {
                return 300
            }
            set {}
        }
    override var frameWidthSize: CGFloat {
            get {
                return 350
            }
            set {}
        }

        override var frameHeightSize: CGFloat {
            get {
                return 350
            }
            set {}
        }
}
class keyTypeBasicDetailEmpty: keyTypeBasicEmpty{
    var keySetting: KeySetting
    init(keySetting: KeySetting) {
        self.keySetting = keySetting
    }

    override var fontSize: CGFloat {
            get {
                return 300
            }
            set {}
        }
    override var frameWidthSize: CGFloat {
            get {
                return 350
            }
            set {}
        }

        override var frameHeightSize: CGFloat {
            get {
                return 350
            }
            set {}
        }
}
