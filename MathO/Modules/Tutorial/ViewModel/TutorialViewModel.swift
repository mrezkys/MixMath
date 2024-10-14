//
//  TutorialViewModel.swift
//  MixMath
//
//  Created by Muhammad Rezky on 14/10/24.
//

import SwiftUI

class TutorialViewModel: ObservableObject {
    @Published var showDisplayText: Bool = true
    @Published var isFinishTutorial: Bool = false
    var displayText: String {
        if showDisplayText {
            return "Jawablah pertanyaan yang muncul di sini dengan jawaban yang tersedia di bawah"
        } else {
            return question
        }
    }
    
    var maximumRetry: Int = 1
    @Published  var answerStates: [AnswerButtonState] = Array(
        repeating: .unselected,
        count: 4
    )
    let question: String = "1 + 3 x 2"
    let choices: [Int] = [7, 8, 12, 18]
    let correctAnswerIndex: Int = 0
    
    func handleAnswerSelection(at index: Int) {
        guard maximumRetry > 0 else { return }
        withAnimation {
            if index == correctAnswerIndex {
                answerStates[index] = .correct
            } else {
                answerStates[index] = .incorrect
            }
            maximumRetry -= 1
        }
    }
}
