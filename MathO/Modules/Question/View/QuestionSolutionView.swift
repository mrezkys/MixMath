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
    let ll: CGFloat
    
    init(question: Math) {
        self.question = question
        self.ll = CGFloat(50 + (5 - (question.solution.count + 1)) * 30)
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
                    
                    CustomIndicator(
                        numberOfStep: question.solution.count + 1,
                        lengthLine: CGFloat(ll),
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
                        SegitigaAjaibView(
                            imagePath: segitigaAjaib(
                                operation: question.solution[currentStep].operationStep,
                                isParenthesis: question.solution[currentStep].isParenthtesis
                            ),
                            descPath: teksAjaib(
                                operation: question.solution[currentStep].operationStep,
                                isParenthtesis: question.solution[currentStep].isParenthtesis
                            )
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


struct SegitigaAjaibView: View {
    var imagePath: String
    let descPath: String
    
    var body: some View {
        VStack {
            Text("Segitiga Ajaib")
                .font(.system(size: 18, design: .rounded))
                .bold()
            
            Image(imagePath)
                .resizable()
                .frame(width: 228, height: 228)
            
            Text(descPath)
                .font(.system(size: 14, design: .rounded))
                .multilineTextAlignment(.center)
                .foregroundColor(.black)
            
            
        }
        .padding(40)
        .frame(maxWidth: .infinity)
        .background(
            RoundedRectangle(cornerRadius: 10)
                .foregroundColor(Color("water"))
        )
    }
}


func teksAjaib(operation: String, isParenthtesis: Bool) -> String {
    let ops = operation.components(separatedBy: " ")[1]
    var parenthesis = "Berdasarkan segitiga ajaib di atas, dapat dilihat bahwa operasi yang berada pada tanda buka kurung dan tutup kurung adalah operasi yang harus didahulukan dalam operasi campuran matematika. Untuk menyelesaikan perhitungan di dalam tanda buka kurung dan tutup kurung, kita melihat kembali di segitiga ajaib bahwa yang pertama harus dikerjakan adalah perkalian dan pembagian, kemudian dilanjutkan dengan penjumlahan dan pengurangan"
    
    if isParenthtesis {
        return parenthesis
    }
    switch ops {
    case "x":
        return "Berdasarkan segitiga ajaib di atas, dapat dilihat bahwa perkalian merupakan operasi kedua yang harus didahulukan dalam operasi campuran matematika."
    case ":":
        return "Berdasarkan segitiga ajaib di atas, dapat dilihat bahwa pembagian merupakan operasi ketiga yang harus didahulukan dalam operasi campuran matematika."
    case "+":
        return "Berdasarkan segitiga ajaib di atas, dapat dilihat bahwa penjumlahan merupakan operasi keempat yang harus didahulukan dalam operasi campuran matematika."
    case "-":
        return "Berdasarkan segitiga ajaib di atas, dapat dilihat bahwa pengurangan merupakan operasi kelima yang harus didahulukan dalam operasi campuran matematika."
    default:
        return "Berdasarkan segitiga ajaib di atas, dapat dilihat bahwa parenthesis merupakan operasi pertama yang harus didahulukan dalam operasi campuran matematika."
    }
}

func segitigaAjaib(operation: String, isParenthesis: Bool) -> String {
    let ops = operation.components(separatedBy: " ")[1]
    if isParenthesis {
        switch ops {
        case "x":
            return "segitiga-ajaib-multi-parenthe"
        case ":":
            return "segitiga-ajaib-diff-parenthe"
        case "+":
            return "segitiga-ajaib-plus-parenthe"
        case "-":
            return "segitiga-ajaib-min-parenthe"
        default:
            return "segitiga-ajaib-diff-parenthe"
        }
    }
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


struct CustomIndicator: View {
    let numberOfStep: Int
    let lengthLine: CGFloat
    @Binding var currentStep: Int
    var onSelect: (Int) -> Void
    
    var body: some View {
        HStack(spacing: 0) {
            ForEach(0..<numberOfStep) { index in
                Button {
                    onSelect(index)
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
