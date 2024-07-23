import SwiftUI
import AVFoundation // 追加



var musicPlayer:AVAudioPlayer!

func speaker(text: String){
    var speechText = text
    switch(text) {
    case "、": speechText = "読点"
    case "。": speechText = "句点"
    case "゛": speechText = "濁点"
    case "゜": speechText = "半濁点"
    case "消": speechText = "消去"
    case "改": speechText = "改行"
    case "←": speechText = "戻る"

    default:
        speechText = text
    }
    do{
        if let musicData = NSDataAsset(name: speechText)?.data {
            musicPlayer = try AVAudioPlayer(data: musicData)
            musicPlayer.play()
    } else {
        print(speechText)
        print("ファイルなし")
        // musicDataがnilの場合の処理をここに記述
    }
//        let musicData = NSDataAsset(name: "あ")!.data
//        musicPlayer = try AVAudioPlayer(data: musicData)
//        musicPlayer.play()
    }catch{
        print("音の再生に失敗しました。")
    }
}
