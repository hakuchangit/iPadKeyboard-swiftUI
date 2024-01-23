//
//  KeyboardView.swift
//  iPadkeyboard
//
//  Created by Izumi Kiuchi on 2024/01/23.
//

import SwiftUI

struct KeyboardView: View {
    var letter: String = "あ"
    var body: some View {

        Button(action: {
            print(letter)
        }, label: {
            Text(letter)
                .padding()
                .font(.system(size: 80, weight: .regular, design: .default))
                .foregroundColor(.white)
                .frame(width: 100, height: 100, alignment: .center)
                .background(.black)
        })



    }
}

#Preview {
    KeyboardView()
}
