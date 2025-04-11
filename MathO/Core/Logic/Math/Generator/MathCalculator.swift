//
//  MathCalculator.swift
//  MixMath
//
//  Created by Muhammad Rezky on 12/04/25.
//

import Foundation

struct MathCalculator {
    /// Removes a parenthesis element and updates indices
    /// - Parameters:
    ///   - parenthesis: Parenthesis array
    ///   - value: Value to remove
    static func removeParenthesisElement(_ parenthesis: inout [Int], _ value: Int) {
        if let index = parenthesis.firstIndex(of: value) {
            parenthesis.remove(at: index)
            var currentIndex = index
            
            while parenthesis.count > currentIndex {
                parenthesis[currentIndex] -= 1
                currentIndex += 1
            }
        }
    }
    
    /// Calculates multiplication and division operations
    /// - Parameters:
    ///   - numArr: Number array (will be modified)
    ///   - opsArr: Operations array (will be modified)
    ///   - ops: The operation to perform
    ///   - index: Operation index
    /// - Returns: Operation string and result
    static func calculateMulDiv(_ numArr: inout [Int], _ opsArr: inout [String], _ ops: String, _ index: Int) -> (show: String, result: Int) {
        let tempN1 = numArr.remove(at: index)
        let tempN2 = numArr.remove(at: index)
        var operation: String = ""
        var result: Int = 0
        
        switch ops {
        case ":":
            result = tempN1 / tempN2
            numArr.insert(result, at: index)
            opsArr.remove(at: index)
            operation = "\(tempN1) : \(tempN2)"
            return (operation, result)
        case "x":
            result = tempN1 * tempN2
            numArr.insert(result, at: index)
            opsArr.remove(at: index)
            operation = "\(tempN1) x \(tempN2)"
            return (operation, result)
        default: 
            return (operation, result)
        }
    }
    
    /// Calculates addition and subtraction operations
    /// - Parameters:
    ///   - numArr: Number array (will be modified)
    ///   - opsArr: Operations array (will be modified)
    ///   - ops: The operation to perform
    ///   - index: Operation index
    /// - Returns: Operation string and result
    static func calculateAddSub(_ numArr: inout [Int], _ opsArr: inout [String], _ ops: String, _ index: Int) -> (show: String, result: Int) {
        let tempN1 = numArr.remove(at: index)
        let tempN2 = numArr.remove(at: index)
        var operation: String = ""
        var result: Int = 0
        
        switch ops {
        case "-":
            result = tempN1 - tempN2
            numArr.insert(result, at: index)
            opsArr.remove(at: index)
            operation = "\(tempN1) - \(tempN2)"
            return (operation, result)
        case "+":
            result = tempN1 + tempN2
            numArr.insert(result, at: index)
            opsArr.remove(at: index)
            operation = "\(tempN1) + \(tempN2)"
            return (operation, result)
        default: 
            return (operation, result)
        }
    }
    
    /// Calculates a mixed operation expression following order of operations
    /// - Parameters:
    ///   - numArrPar: Number array
    ///   - opsArrPar: Operations array
    ///   - parenthesis: Optional parenthesis positions
    /// - Returns: Correct answer and solution steps
    static func calculateMixedOperation(numArrPar: [Int], opsArrPar: [String], parenthesis: [Int]? = nil) -> (correctAnswer: Int, solution: [MathSolution]) {
        var numArr = numArrPar
        var opsArr = opsArrPar
        var solvingStep: [String]
        var operation: (show: String, result: Int)
        var randomAnswer: (answerOptions: [Int], rightAnswerIndex: Int?)
        var mathSolutionSteps: [MathSolution] = []
        var index = 0
        
        // First handle operations in parentheses
        if var parenthesis = parenthesis {
            // Handle multiplication and division inside parentheses
            for ops in opsArr {
                if (ops == ":" || ops == "x") && parenthesis.contains(index) {
                    solvingStep = ExpressionFormatter.formatExpression(
                        numArr: numArr, 
                        opsArr: opsArr,
                        opsIndex: index, 
                        parenthesis: parenthesis
                    )
                    removeParenthesisElement(&parenthesis, index)
                    operation = calculateMulDiv(&numArr, &opsArr, ops, index)
                    randomAnswer = AnswerGenerator.generateAnswerOptions(rightAnswer: operation.result)
                    
                    mathSolutionSteps.append(MathSolution(
                        solvingStep: solvingStep, 
                        operationStep: operation.show, 
                        answerOptions: randomAnswer.answerOptions, 
                        rightAnswerIndex: randomAnswer.rightAnswerIndex!, 
                        isParenthesis: true
                    ))
                    continue
                }
                index += 1
            }
            
            index = 0
            
            // Handle addition and subtraction inside parentheses
            for ops in opsArr {
                if (ops == "-" || ops == "+") && parenthesis.contains(index) {
                    solvingStep = ExpressionFormatter.formatExpression(
                        numArr: numArr, 
                        opsArr: opsArr,
                        opsIndex: index, 
                        parenthesis: parenthesis
                    )
                    removeParenthesisElement(&parenthesis, index)
                    operation = calculateAddSub(&numArr, &opsArr, ops, index)
                    randomAnswer = AnswerGenerator.generateAnswerOptions(rightAnswer: operation.result)
                    
                    mathSolutionSteps.append(MathSolution(
                        solvingStep: solvingStep, 
                        operationStep: operation.show, 
                        answerOptions: randomAnswer.answerOptions, 
                        rightAnswerIndex: randomAnswer.rightAnswerIndex!, 
                        isParenthesis: true
                    ))
                    continue
                }
                index += 1
            }
            
            index = 0
        }
        
        // Handle multiplication and division outside parentheses
        for ops in opsArr {
            if ops == ":" || ops == "x" {
                solvingStep = ExpressionFormatter.formatExpression(
                    numArr: numArr, 
                    opsArr: opsArr, 
                    opsIndex: index
                )
                operation = calculateMulDiv(&numArr, &opsArr, ops, index)
                randomAnswer = AnswerGenerator.generateAnswerOptions(rightAnswer: operation.result)
                
                mathSolutionSteps.append(MathSolution(
                    solvingStep: solvingStep, 
                    operationStep: operation.show, 
                    answerOptions: randomAnswer.answerOptions, 
                    rightAnswerIndex: randomAnswer.rightAnswerIndex!
                ))
                continue
            }
            index += 1
        }
        
        index = 0
        
        // Handle addition and subtraction outside parentheses
        for ops in opsArr {
            if ops == "-" || ops == "+" {
                solvingStep = ExpressionFormatter.formatExpression(
                    numArr: numArr, 
                    opsArr: opsArr, 
                    opsIndex: index
                )
                operation = calculateAddSub(&numArr, &opsArr, ops, index)
                randomAnswer = AnswerGenerator.generateAnswerOptions(rightAnswer: operation.result)
                
                mathSolutionSteps.append(MathSolution(
                    solvingStep: solvingStep, 
                    operationStep: operation.show, 
                    answerOptions: randomAnswer.answerOptions, 
                    rightAnswerIndex: randomAnswer.rightAnswerIndex!
                ))
                continue
            }
            index += 1
        }
        
        return (numArr[0], mathSolutionSteps)
    }
}
