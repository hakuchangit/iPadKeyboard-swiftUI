//
//  ContentView.swift
//  iPadkeyboard
//
//  Created by Izumi Kiuchi on 2023/12/02.
//

import SwiftUI
import CoreBluetooth
var peripheralManager = PeripheralManager()
var synthesizer = AVSpeechSynthesizer()
import AVFoundation

struct ContentView: View {
    @State var advertiseIsOn: Bool = false
    @State private var isShowingView: Bool = false

    var body: some View {
        NavigationView {
            HStack{
                VStack(spacing: 10) {
                    Text("接続状態：\(advertiseIsOn ? "接続中" : "未接続")")
                        .font(.largeTitle)
                        .padding(30)
                    Button(action: advertise) {
                        Text("\(advertiseIsOn ? "Windowsに接続する" : "接続を切る")")
                            .font(.largeTitle)
                            .foregroundColor(Color.white)
                    }
                    .frame(width: 300, height: 40)
                    .padding(.all)
                    .background(Color.blue)
                }
                VStack(spacing: 10) {
                    Text("TOP画面です")
                        .font(.largeTitle)
                        .padding(30)
                    NavigationLink {
                        KeyBoardBasicDetailView()
                        //BasicKeyboardView()
                    } label: {
                        Text("BigKeyboard")
                            .font(.largeTitle)
                            .foregroundColor(Color.white)
                    }.frame(width: 300, height: 40)
                        .padding(.all)
                        .background(Color.blue)
                    NavigationLink {
                        BasicKeyboardView()
                    } label: {
                        Text("BasicKeyboard")
                            .font(.largeTitle)
                            .foregroundColor(Color.white)
                    }.frame(width: 300, height: 40)
                        .padding(.all)
                        .background(Color.blue)
                }
            }
        }.navigationViewStyle(.stack)
}
private func advertise(){
    peripheralManager.startAdvertising()
    advertiseIsOn = true

}
private func stopAdvertise(){
    advertiseIsOn = false
    peripheralManager.stopAdvertising()
}

private func notify(){
    peripheralManager.notify(text: "あ")
}


}

@available(iOS 17.0, *)
#Preview  ("横画面(右)", traits: PreviewTrait.landscapeLeft){
    ContentView().environmentObject(KeySetting())
}
