//
//  Math.swift
//  MathO
//
//  Created by Vincent Gunawan on 30/03/23.
//

import Foundation

struct Math {
    let selectedPattern: [String]
    
    /// The generated random question with numbers and optional parentheses
    let randomQuestion: (number: [Int], parenthesis: [Int]?)
    
    /// String representation of the question
    var stringQuestion: String
    
    /// The correct answer to the question
    let correctAnswer: Int
    
    /// The answer options and the index of the correct answer
    let answerOption: (answerOptions: [Int], rightAnswerIndex: Int?)
    
    /// The step-by-step solutions to solve the question
    let solution: [MathSolution]

    /// Initializes a new math question with the specified operation patterns
    /// - Parameter selectedPattern: The operation patterns to use (defaults to ["*","-","+","/"])
    init(selectedPattern: [String] = ["*","-","+","/"]) {
        self.selectedPattern = selectedPattern
        self.randomQuestion = QuestionGenerator.generateQuestion(
            opsArr: selectedPattern, 
            isParenthesis: arc4random_uniform(2) == 0 ? false : true
        )
        self.stringQuestion = ExpressionFormatter.formatExpression(
            numArr: randomQuestion.number, 
            opsArr: selectedPattern, 
            opsIndex: -1, 
            parenthesis: randomQuestion.parenthesis
        )[0]
        
        let result = MathCalculator.calculateMixedOperation(
            numArrPar: randomQuestion.number, 
            opsArrPar: selectedPattern, 
            parenthesis: randomQuestion.parenthesis
        )
        self.correctAnswer = result.correctAnswer
        self.solution = result.solution
        self.answerOption = AnswerGenerator.generateAnswerOptions(
            numArr: randomQuestion.number, 
            opsArr: selectedPattern, 
            rightAnswer: self.correctAnswer
        )
    }
}
