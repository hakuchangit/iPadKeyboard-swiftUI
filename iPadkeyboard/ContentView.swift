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
            VStack(spacing: 10) {
                Text("TOP画面です")
                NavigationLink("次のViewへ", destination: KeyboardView())

                VStack {
                    Button(action: advertise) {
                        Text("Start advertise")
                            .font(.largeTitle)
                            .foregroundColor(Color.white)
                    }
                    .frame(width: 250, height: 40)
                    .padding(.all)
                    .background(Color.blue)


                    Button(action: stopAdvertise) {
                        Text("Stop advertise")
                            .font(.largeTitle)
                            .foregroundColor(advertiseIsOn ? Color.white : Color.gray)
                    }
                    .frame(width: 250, height: 40)
                    .padding(.all)
                    .background(Color.blue)


                    Button(action: notify) {
                        Text("Notify")
                            .font(.largeTitle)
                            .foregroundColor(advertiseIsOn ? Color.white : Color.gray)
                    }
                    .frame(width: 250, height: 40)
                    .padding(.all)
                    .background(Color.blue)

                    Button(action: indicate) {
                        Text("Indicate")
                            .font(.largeTitle)
                            .foregroundColor(advertiseIsOn ? Color.white : Color.gray)
                    }
                    .frame(width: 250, height: 40)
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

    peripheralManager.stopAdvertising()
}

private func notify(){
    peripheralManager.notify(text: "あ")
}

private func indicate(){
    peripheralManager.indicate()
}

}

#Preview  ("横画面(右)", traits: PreviewTrait.landscapeLeft){
    ContentView()
}
