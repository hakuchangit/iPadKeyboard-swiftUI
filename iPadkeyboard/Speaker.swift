import SwiftUI
import AVFoundation // 追加



var musicPlayer:AVAudioPlayer!

func speaker(text: String){
    var speechText = text
    switch(text) {
    case ",": speechText = "句読点"
    case "。": speechText = "句点"
    case "゛": speechText = "濁点"
    case "゜": speechText = "半濁点"

    default:
        speechText = text
    }
    do{
        if let musicData = NSDataAsset(name: speechText)?.data {
            musicPlayer = try AVAudioPlayer(data: musicData)
            musicPlayer.play()
    } else {
        // musicDataがnilの場合の処理をここに記述
    }
//        let musicData = NSDataAsset(name: "あ")!.data
//        musicPlayer = try AVAudioPlayer(data: musicData)
//        musicPlayer.play()
    }catch{
        print("音の再生に失敗しました。")
    }
}
