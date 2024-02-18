//
//  KeyColor.swift
//  iPadkeyboard
//
//  Created by Izumi Kiuchi on 2024/02/17.
//

import Foundation
import SwiftUI

enum KeyColor{
    case type1
    case type2
    func keyColor(column:Int) -> Color {
        let col = column % 2
            switch( self ){
            case .type1:
                if col == 1 { return Color(red: 0.098, green: 0.09, blue: 0.541, opacity: 1.0) }
                else { return Color(red: 0.996, green: 0.345, blue: 0.005, opacity: 1.0) }
            case .type2:
                if col == 1 { return Color.black }
                else { return Color(red: 0.658, green: 0.658, blue: 0.658, opacity: 1.0) }
            }
        }
    func letterColor(column:Int) -> Color {
        let col = column % 2
        switch( self ){
        case .type1:
            return Color.white
        case .type2:
            if col == 1 { return Color.white }
            else { return Color.black }
        }
    }
}
