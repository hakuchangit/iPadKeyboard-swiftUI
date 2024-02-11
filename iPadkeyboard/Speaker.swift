//
//  Speaker.swift
//  iPadkeyboard
//
//  Created by Izumi Kiuchi on 2024/01/31.
//

import Foundation
import AVFoundation


public func Speaker(text:String){
    let utterance = AVSpeechUtterance(string: text)
           utterance.voice = AVSpeechSynthesisVoice(language: "ja-JP")
           utterance.rate = 0.5
           let synthesizer = AVSpeechSynthesizer()
           synthesizer.speak(utterance)
    print(text)


}
