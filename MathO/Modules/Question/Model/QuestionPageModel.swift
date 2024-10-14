//
//  QuestionPageModel.swift
//  MixMath
//
//  Created by Muhammad Rezky on 14/10/24.
//

import Foundation

struct QuestionPageModel {
    let mathQuestion: Math
    var selectedAnswerIndex: Int? = nil

    var isCorrect: Bool? {
        guard let selected = selectedAnswerIndex else { return nil }
        return selected == mathQuestion.answerOption.rightAnswerIndex
    }

    static func generateQuestions(from patterns: [String]) -> [QuestionPageModel] {
        return patterns.map { pattern in
            let math = Math(selectedPattern: pattern.components(separatedBy: ","))
            return QuestionPageModel(mathQuestion: math)
        }
    }
}
