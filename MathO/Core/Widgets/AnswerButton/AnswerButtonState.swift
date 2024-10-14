//
//  AnswerButtonState.swift
//  MixMath
//
//  Created by Muhammad Rezky on 14/10/24.
//

import SwiftUI

enum AnswerButtonState {
    case unselected
    case correct
    case incorrect

    var backgroundColor: Color {
        switch self {
        case .unselected:
            return Color("water")
        case .correct:
            return Color("americanGreen")
        case .incorrect:
            return Color("fireOpal")
        }
    }

    var cornerRadius: CGFloat {
        self == .correct ? .infinity : 24
    }
}
