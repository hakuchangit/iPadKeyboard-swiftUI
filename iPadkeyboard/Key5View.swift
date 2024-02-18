//
//  SwiftUIView.swift
//  iPadkeyboard
//
//  Created by Izumi Kiuchi on 2024/01/27.
//

import SwiftUI

struct Key5View: View {
    var column:Int = 0
    var letters:[String] = ["あ","い","う","え","お"]
    var keyColorNumber = 1
    var letterColor = Color.white

    var body: some View {
        VStack{
            ForEach(letters, id: \.self) { letter in
                KeyView(letter: letter, column: column)
            }
        }
    }
}

#Preview ("横画面(右)", traits: PreviewTrait.landscapeLeft){
    Key5View()
}
