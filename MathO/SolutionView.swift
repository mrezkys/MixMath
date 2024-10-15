//
//  SolutionView.swift
//  Question Screen Math'o
//
//  Created by Petrus Sinaga on 03/04/23.
//

import SwiftUI

struct SolutionView: View {
    @State private var currentStep = 0
    private var question: Math
    let ll: CGFloat
    @State public var currentPageIndex: Int = 0
    @State public var isCircle: [[Bool]] = Array(repeating: [false, false, false, false], count: 12)
    @State public var isSelected: [[Bool]] = Array(repeating: [false, false, false, false], count: 12)
    @State var showSummaryView: Bool = false
    @State var answerCorrectly: [Bool?] = Array(repeating: nil, count: 4)
    @State private var isShowingTriangle: Bool = false
    @State private var isFinishSolution: Bool = false
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    @State var isSolutionFinished: Bool = false

    
    
    init(question: Math) {
        self.question = question
        self.ll = CGFloat(50 + (5-(question.solution.count+1)) * 30)
    }
    
    var body: some View {
        NavigationView(){
            ScrollView{
                VStack{
                    if(currentStep < question.solution.count){
                        HStack{
                            ForEach(0..<question.solution[currentStep].solvingStep.count, id: \.self) { solvingStepIndex in
                                Text(question.solution[currentStep].solvingStep[solvingStepIndex])
                                    .font(.system(size: 32, design: .rounded))
                                    .bold()
                                    .opacity(solvingStepIndex == 1 ? 1 : 0.5)
                            }
                        }
                    }
                    
                    CustomIndicator(numberOfStep: question.solution.count + 1, lengthLine: CGFloat(ll), currentStep: $currentStep)
                        .padding(24)
                    
                    if(currentStep < question.solution.count){
                        
                        VStack {
                            Text("Kamu perlu menjawab pertanyaan ini")
                                .font(.system(size: 16, design: .rounded))
                                .foregroundColor(.white)
                                .bold()
                            if(!isShowingTriangle) {
                                Text("\(question.solution[currentStep].operationStep)"
                                )
                                    .font(.system(size: 48, design: .rounded))
                                    .foregroundColor(.white)
                                    .bold()
                                    .padding(.top, 1)
                            } else {
                                Text("\(question.solution[currentStep].operationStep) = \(question.solution[currentStep].answerOptions[question.solution[currentStep].rightAnswerIndex])"
                                )
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
                        .padding([.leading, .bottom, .trailing], 32)
                        
                        if !isShowingTriangle {
                            VStack (spacing: 16) {
                                HStack (spacing: 16) {
                                    AnswerButton(generatedNumber: question.solution[currentStep].answerOptions[0], isCircle: $isCircle[currentStep], isSelected: $isSelected[currentStep], index: 0, correctAnswer: question.solution[currentStep].rightAnswerIndex, answerCorrectly: $answerCorrectly, currentPageIndex: currentStep)
                                    
                                    AnswerButton(generatedNumber: question.solution[currentStep].answerOptions[1], isCircle: $isCircle[currentStep], isSelected: $isSelected[currentStep], index: 1, correctAnswer: question.solution[currentStep].rightAnswerIndex, answerCorrectly: $answerCorrectly, currentPageIndex: currentStep)
                                }
                                .padding(.horizontal, 32)
                                
                                HStack (spacing: 16){
                                    AnswerButton(generatedNumber: question.solution[currentStep].answerOptions[2], isCircle: $isCircle[currentStep], isSelected: $isSelected[currentStep], index: 2, correctAnswer: question.solution[currentStep].rightAnswerIndex, answerCorrectly: $answerCorrectly, currentPageIndex: currentStep)
                                    
                                    AnswerButton(generatedNumber: question.solution[currentStep].answerOptions[3], isCircle: $isCircle[currentStep], isSelected: $isSelected[currentStep], index: 3, correctAnswer: question.solution[currentStep].rightAnswerIndex, answerCorrectly: $answerCorrectly, currentPageIndex: currentStep)
                                }
                                .padding(.horizontal, 32)
                            }
                            .onChange(of: isSelected[currentStep]) { newValue in
                                DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                                    isShowingTriangle = true
                                }
                            }
                        } else {
                            SegitigaAjaibView(
                                imagePath: segitigaAjaib(operation: question.solution[currentStep].operationStep, isParenthesis: question.solution[currentStep].isParenthtesis), descPath: teksAjaib(operation: question.solution[currentStep].operationStep, isParenthtesis: question.solution[currentStep].isParenthtesis))
                                .onChange(of: currentStep) { newValue in
                                    isShowingTriangle = false
                                }
                        }
                    } else {
                        SolutionWrapUpView(question: question)
                    }
                    
                }.padding(.vertical, 16)
            }
            .background(
                GeometryReader { geometry in
                    Color.clear
                        .frame(height: geometry.safeAreaInsets.top)
                        .background(Color.clear)
                        .edgesIgnoringSafeArea(.top)
                }
            )
        }
        .navigationBarTitle("Bantuan Soal")
        .navigationBarItems(
            trailing: Button {
                if currentStep < question.solution.count {
                    currentStep += 1
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
        .padding(.horizontal, 32)
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



struct SolutionView_Previews: PreviewProvider {
    static var previews: some View {
        SolutionView(question: Math())
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




struct AnswerButton: View {
    let generatedNumber: Int
    @Binding var isCircle: [Bool]
    @Binding var isSelected: [Bool]
    var pattern: String = ""
    let index: Int
    let correctAnswer: Int
    @Binding var answerCorrectly: [Bool?]
    let currentPageIndex: Int
    
    @ObservedObject var patternViewModel = PatternViewModel()
    var body: some View {
        Button {
            withAnimation {
                if correctAnswer == index {
                    isCircle[index].toggle()
                    isSelected[index].toggle()
                    if(currentPageIndex != -1){
                        if pattern != ""{
                            patternViewModel.addPattern(PatternAnswerModel(pattern: pattern, value: 1.0))
                        }
                        answerCorrectly[currentPageIndex] = true
                    }
                } else {
                    isSelected[index].toggle()
                    if(currentPageIndex != -1){
                        if pattern != ""{
                            patternViewModel.addPattern(PatternAnswerModel(pattern: pattern, value: -1.0))
                        }
                        answerCorrectly[currentPageIndex] = false
                    }
                }
            }
        } label: {
            Text("\(generatedNumber)")
                .font(.system(size: 36, design: .rounded))
                .bold()
                .foregroundColor(Color.black)
                .frame(maxWidth: .infinity, maxHeight: 400)
                .background(
                    RoundedRectangle(cornerRadius: isCircle[index] ? .infinity : 24)
                        .fill(isCircle[index] ? Color("americanGreen") : isSelected[index] ? Color("fireOpal") : Color("water"))
                        .scaleEffect(isCircle[index] ? 1.0 : 1.0)
                        .animation(.easeIn(duration: 0.1))
                )
                .foregroundColor(Color.white)
                .aspectRatio(1, contentMode: .fit)
        }
        .disabled(isCircle.contains(where: {
            $0 == true
        }) || isSelected.contains(where: {
            $0 == true
        }))
    }
}
