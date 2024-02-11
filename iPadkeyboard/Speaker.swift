import SwiftUI
import AVFoundation // 追加



var musicPlayer:AVAudioPlayer!

func speaker(text: String){
    do{
        let musicData = NSDataAsset(name: "あ")!.data
        musicPlayer = try AVAudioPlayer(data: musicData)
        musicPlayer.play()
    }catch{
        print("音の再生に失敗しました。")
    }
}
