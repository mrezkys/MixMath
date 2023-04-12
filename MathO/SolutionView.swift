//
//  SolutionView.swift
//  Question Screen Math'o
//
//  Created by Petrus Sinaga on 03/04/23.
//

import SwiftUI

struct SolutionView: View {
    @State private var currentStep = 0
    private var solution: [MathSolution]
    let ll: CGFloat
    @State public var currentPageIndex: Int = 0
    @State public var isCircle: [[Bool]] = Array(repeating: [false, false, false, false], count: 12)
    @State public var isSelected: [[Bool]] = Array(repeating: [false, false, false, false], count: 12)
    @State var showSummaryView: Bool = false
    @State var answerCorrectly: [Bool?] = Array(repeating: nil, count: 4)
    @State private var isShowingTriangle: Bool = false
    @State private var isFinishSolution: Bool = false
    
    
    init(solution: [MathSolution]) {
        self.solution = solution
        self.ll = CGFloat(50 + (5-solution.count) * 30)
    }
    
    var body: some View {
        
        ZStack {
            Color("SoftOrange")
            VStack {
                HStack{
                    ForEach(0..<solution[currentStep].solvingStep.count, id: \.self) { solvingStepIndex in
                        Text(solution[currentStep].solvingStep[solvingStepIndex])
                            .font(.system(size: 32, design: .rounded))
                            .bold()
                            .opacity(solvingStepIndex == 1 ? 1 : 0.5)
                    }
                }
                
                
                //                    .background(
                //                        RoundedRectangle(cornerRadius: 10)
                //                            .frame(width: 335, height: 84)
                //                            .foregroundColor(Color.white)
                //                            .overlay(
                //                                    RoundedRectangle(cornerRadius: 10)
                //                                        .stroke(Color.black, lineWidth: 3)
                //                            )
                //                    )
                //                    .padding(24)
                
                CustomIndicator(numberOfStep: solution.count, lengthLine: CGFloat(ll), currentStep: $currentStep)
                    .padding(24)
                
                VStack {
                    Text("Kamu perlu menjawab pertanyaan ini")
                        .font(.system(size: 16, design: .rounded))
                        .bold()
                    Text(solution[currentStep].operationStep)
                        .font(.system(size: 48, design: .rounded))
                        .bold()
                        .padding(.top, 1)
                }
                .padding(.horizontal, 8)
                .padding(.vertical, 24)
                .frame(maxWidth: .infinity)
                .background(
                    RoundedRectangle(cornerRadius: 10)
                        .foregroundColor(Color("celestialBlue"))
                )
                .padding([.leading, .bottom, .trailing], 32)
                
                if !isShowingTriangle {
                    VStack (spacing: 16) {
                        HStack (spacing: 16) {
                            AnswerButton(generatedNumber: solution[currentStep].answerOptions[0], isCircle: $isCircle[currentStep], isSelected: $isSelected[currentStep], index: 0, correctAnswer: solution[currentStep].rightAnswerIndex, answerCorrectly: $answerCorrectly, currentPageIndex: currentStep)
                            
                            AnswerButton(generatedNumber: solution[currentStep].answerOptions[1], isCircle: $isCircle[currentStep], isSelected: $isSelected[currentStep], index: 1, correctAnswer: solution[currentStep].rightAnswerIndex, answerCorrectly: $answerCorrectly, currentPageIndex: currentStep)
                        }
                        .padding(.horizontal, 32)
                        
                        HStack (spacing: 16){
                            AnswerButton(generatedNumber: solution[currentStep].answerOptions[2], isCircle: $isCircle[currentStep], isSelected: $isSelected[currentStep], index: 2, correctAnswer: solution[currentStep].rightAnswerIndex, answerCorrectly: $answerCorrectly, currentPageIndex: currentStep)
                            
                            AnswerButton(generatedNumber: solution[currentStep].answerOptions[3], isCircle: $isCircle[currentStep], isSelected: $isSelected[currentStep], index: 3, correctAnswer: solution[currentStep].rightAnswerIndex, answerCorrectly: $answerCorrectly, currentPageIndex: currentStep)
                        }
                        .padding(.horizontal, 32)
                    }
                    .onChange(of: isSelected[currentStep]) { newValue in
                        DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
                            isShowingTriangle = true
                        }
                    }
                } else {
                    SegitigaAjaibView()
                        .onChange(of: currentStep) { newValue in
                            isShowingTriangle = false
                        }
                }
                
            }
            .padding(10)
            .navigationBarItems(trailing: Button(action: {
                isFinishSolution.toggle()
            }, label: {
                Text("Mengerti")
            })
                .disabled(currentStep != solution.count-1)
            )
            
            NavigationLink(destination: WrapUpView(), isActive: $isFinishSolution) {
                EmptyView()
            }
        }
    }
}



func segitigaAjaib(operation: String) -> String {
    let ops = operation.components(separatedBy: " ")[1]
    
    switch ops {
    case "x":
        return "segitiga-ajaib-multi"
    case ":":
        return "segitiga-ajaib-diff"
    case "+":
        return "segitiga-ajaib-plus"
    case "-":
        return "segitiga-ajaib-min"
    default:
        return "segitiga-ajaib-diff"
    }
}



struct SolutionView_Previews: PreviewProvider {
    static var previews: some View {
        SolutionView(solution: Math().solution)
    }
}

struct CustomIndicator: View {
    let numberOfStep: Int
    let lengthLine: CGFloat
    @Binding var currentStep: Int
    
    
    var body: some View {
        HStack(spacing: 0) {
            ForEach(0..<numberOfStep) { index in
                Button {
                    currentStep = index
                } label: {
                    Circle()
                        .fill(currentStep > index ? Color.blue : Color("water"))
                        .frame(width: 20, height: 20)
                        .overlay (
                            Circle()
                                .stroke(Color.blue, lineWidth: 10)
                                .opacity(index <= currentStep ? 1 : 0)
                        )
                }
                
                
                if index != numberOfStep - 1 {
                    Rectangle()
                        .fill(currentStep >= index ?
                              Color.blue : Color("water"))
                        .frame(width: lengthLine, height: 5)
                }
                
            }
        }
    }
}
