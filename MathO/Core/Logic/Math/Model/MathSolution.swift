//
//  MathSolution.swift
//  MathO
//
//  Created by Enzu Ao on 05/04/23.
//

import Foundation

/// Represents a step in the mathematical solution process
struct MathSolution {
    /// The visual representation of the solving step
    let solvingStep: [String]
    
    /// The text representation of the operation performed in this step
    let operationStep: String
    
    /// The answer options to be presented to the user
    let answerOptions: [Int]
    
    /// The index of the correct answer in the answerOptions array
    let rightAnswerIndex: Int
    
    /// Indicates whether this step involves a parenthesized expression
    let hasParentheses: Bool
    
    init(solvingStep: [String], operationStep: String, answerOptions: [Int], rightAnswerIndex: Int, isParenthesis: Bool = false) {
        self.solvingStep = solvingStep
        self.operationStep = operationStep
        self.answerOptions = answerOptions
        self.rightAnswerIndex = rightAnswerIndex
        self.hasParentheses = isParenthesis
    }
}
