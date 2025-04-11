//
//  SolutionView.swift
//  Question Screen Math'o
//
//  Created by Petrus Sinaga on 03/04/23.
//

import SwiftUI

struct QuestionSolutionView: View {
    var question: Math

    @State private var currentStep = 0
    @State private var currentPageIndex: Int = 0
    @State public var temporaryAnswerStates: [AnswerButtonState] = Array(repeating: .unselected, count: 4)

    @State var isShowingTriangle: Bool = false
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    let lengtLine: CGFloat
    
    init(question: Math) {
        self.question = question
        self.lengtLine = CGFloat(50 + (5 - (question.solution.count + 1)) * 30)
    }
    
    var body: some View {
        ScrollView {
            VStack {
                if currentStep < question.solution.count {
                    HStack {
                        ForEach(0..<question.solution[currentStep].solvingStep.count, id: \.self) { solvingStepIndex in
                            Text(question.solution[currentStep].solvingStep[solvingStepIndex])
                                .font(.system(size: 32, weight: .bold, design: .rounded))
                                .opacity(solvingStepIndex == 1 ? 1 : 0.5)
                        }
                    }
                    Spacer().frame(height: 24)
                    VStack {
                        Text("Kamu perlu menjawab pertanyaan ini")
                            .font(.system(size: 16, design: .rounded))
                            .foregroundColor(.white)
                            .bold()
                        if !isShowingTriangle {
                            Text("\(question.solution[currentStep].operationStep)")
                                .font(.system(size: 48, design: .rounded))
                                .foregroundColor(.white)
                                .bold()
                                .padding(.top, 1)
                        } else {
                            Text("\(question.solution[currentStep].operationStep) = \(question.solution[currentStep].answerOptions[question.solution[currentStep].rightAnswerIndex])")
                                .font(.system(size: 48, design: .rounded))
                                .foregroundColor(.white)
                                .bold()
                                .padding(.top, 1)
                        }
                    }
                    .padding(.horizontal, 8)
                    .padding(.vertical, 24)
                    .frame(maxWidth: .infinity)
                    .background(
                        RoundedRectangle(cornerRadius: 10)
                            .foregroundColor(Color("celestialBlue"))
                    )
                    
                    Spacer().frame(height: 24)
                    
                    SolutionIndicatorView(
                        numberOfStep: question.solution.count + 1,
                        lengthLine: CGFloat(lengtLine),
                        currentStep: $currentStep,
                        onSelect: {index in
                            currentStep = index
                            isShowingTriangle = false
                            
                            temporaryAnswerStates = Array(repeating: .unselected, count: 4)
                        }
                    )
                    
                    Spacer().frame(height: 24)
                    
                    if !isShowingTriangle {
                        AnswerButtonGrid(
                            options: question.solution[currentStep].answerOptions,
                            stateProvider: { index in
                                answerButtonState(for: index)
                            },
                            onSelect: { index in
                                handleAnswerSelection(at: index)
                            }
                        )
                    } else {
                        MagicTriangleView(
                            operation: question.solution[currentStep].operationStep,
                            isParenthesis: question.solution[currentStep].hasParentheses
                        )
                        .onChange(of: currentStep) { newValue in
                            isShowingTriangle = false
                        }
                        
                    }
                } else {
                    QuestionSolutionWrapUpView(question: question)
                }
            }
            .padding([.top, .leading, .trailing], 24)
        }
        .navigationBarTitle("Bantuan Soal")
        .navigationBarItems(
            trailing: Button {
                if currentStep < question.solution.count {
                    currentStep += 1
                    isShowingTriangle = false
                    
                    temporaryAnswerStates = Array(repeating: .unselected, count: 4)
                } else {
                    presentationMode.wrappedValue.dismiss()
                }
            } label: {
                if currentStep < question.solution.count {
                    Text("Selanjutnya")
                } else {
                    Text("Selesai")
                }
            }
        )
    }
    
    private func handleAnswerSelection(at index: Int) {
        withAnimation {
            temporaryAnswerStates[index] = question.solution[currentStep].rightAnswerIndex == index ? .correct : .incorrect
            DispatchQueue.main.asyncAfter(deadline: .now() + 1){
                isShowingTriangle = true
            }
        }
    }
    
    private func answerButtonState(for index: Int) -> AnswerButtonState {
        temporaryAnswerStates[index]
    }
}


struct QuestionSolutionView_Previews: PreviewProvider {
    static var previews: some View {
        QuestionSolutionView(question: Math())
    }
}
