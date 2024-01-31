//
//  SwiftUIView.swift
//  iPadkeyboard
//
//  Created by Izumi Kiuchi on 2024/01/27.
//

import SwiftUI

struct Key5View: View {
    var letters:[String] = ["あ","い","う","え","お"]
    var keyColor = Color.black
    var letterColor = Color.white



    var body: some View {
        VStack{
            ForEach(letters, id: \.self) { letter in
                KeyView(letter: letter, keyColor: keyColor)
            }
        }
    }
}

#Preview ("横画面(右)", traits: PreviewTrait.landscapeLeft){
    Key5View()
}
