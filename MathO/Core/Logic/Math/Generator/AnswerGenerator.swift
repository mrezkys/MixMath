//
//  AnswerGenerator.swift
//  MixMath
//
//  Created by Muhammad Rezky on 12/04/25.
//

import Foundation

struct AnswerGenerator {
    /// Generates a wrong answer that's close to the correct answer
    /// - Parameter rightAnswer: The correct answer
    /// - Returns: A close but incorrect answer
    static func generateCloseWrongAnswer(rightAnswer: Int) -> Int {
        var randomAnswer: [Int] = []
        randomAnswer.append(Int.random(in: rightAnswer-6..<rightAnswer-1))
        randomAnswer.append(Int.random(in: rightAnswer+1..<rightAnswer+6))
        
        return randomAnswer[Int.random(in: 0..<randomAnswer.count)]
    }
    
    /// Generates a wrong answer that's far from the correct answer
    /// - Parameter rightAnswer: The correct answer
    /// - Returns: A distant but incorrect answer
    static func generateFarWrongAnswer(rightAnswer: Int) -> Int {
        var randomAnswer: [Int] = []
        randomAnswer.append(Int.random(in: rightAnswer-50..<rightAnswer-11))
        randomAnswer.append(Int.random(in: rightAnswer+11..<rightAnswer+50))
        
        return randomAnswer[Int.random(in: 0..<randomAnswer.count)]
    }
    
    /// Generates a wrong answer by applying incorrect calculation
    /// - Parameters:
    ///   - numArr: The number array
    ///   - opsArr: The operations array
    /// - Returns: An incorrect answer
    static func generateWrongCalculation(numArr: [Int], opsArr: [String]) -> Int {
        var wrongAnswer: Int = numArr[0]
        var index: Int = 0
        
        for ops in opsArr {
            index += 1
            switch(ops) {
            case "+":
                wrongAnswer += numArr[index]
            case "-":
                wrongAnswer -= numArr[index]
            case "x":
                wrongAnswer *= numArr[index]
            case ":":
                if wrongAnswer % numArr[index] == 0 {
                    wrongAnswer /= numArr[index]
                } else {
                    wrongAnswer += numArr[index]
                }
            default: continue
            }
        }
        return wrongAnswer
    }
    
    /// Selects a random wrong answer generation strategy
    /// - Parameters:
    ///   - numArr: Number array
    ///   - opsArr: Operations array
    ///   - rightAnswer: The correct answer
    ///   - selectedFunction: Optional strategy selector (1=close, 2=far, 3=wrong calculation)
    /// - Returns: A wrong answer
    static func selectRandomWrongAnswerStrategy(_ numArr: [Int], _ opsArr: [String], _ rightAnswer: Int, selectedFunction: Int = 0) -> Int {
        var strategy = selectedFunction
        
        if strategy == 0 {
            strategy = Int.random(in: 1..<4)
        }
        
        switch strategy {
        case 1:
            return generateCloseWrongAnswer(rightAnswer: rightAnswer)
        case 2:
            return generateFarWrongAnswer(rightAnswer: rightAnswer)
        case 3:
            return generateWrongCalculation(numArr: numArr, opsArr: opsArr)
        default:
            return 0
        }
    }
    
    /// Generates a set of answer options including the correct answer
    /// - Parameters:
    ///   - numArr: Number array
    ///   - opsArr: Operations array
    ///   - rightAnswer: The correct answer
    /// - Returns: Answer options and the index of the correct answer
    static func generateAnswerOptions(numArr: [Int] = [], opsArr: [String] = [], rightAnswer: Int) -> (answerOptions: [Int], rightAnswerIndex: Int?) {
        var answerOptions: [Int] = [rightAnswer]
        var answer = 0
        let opsArrCount: Int = opsArr.count
        
        if opsArrCount <= 1 {
            // For simple operations, use close wrong answers
            while(true) {
                answer = selectRandomWrongAnswerStrategy(numArr, opsArr, rightAnswer, selectedFunction: 1)
                
                if !answerOptions.contains(answer) {
                    answerOptions.append(answer)
                }
                
                if answerOptions.count >= 4 { break }
            }
        } else if opsArrCount >= 2 {
            // For complex operations, use various wrong answer strategies
            while(true) {
                answer = selectRandomWrongAnswerStrategy(numArr, opsArr, rightAnswer)
                
                if !answerOptions.contains(answer) {
                    answerOptions.append(answer)
                }
                
                if answerOptions.count >= 4 { break }
            }
        }
        
        let shuffledOptions = answerOptions.shuffled()
        return (shuffledOptions, shuffledOptions.firstIndex(of: rightAnswer))
    }
}
