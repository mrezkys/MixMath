//
//  TestView.swift
//  MathO
//
//  Created by Vincent Gunawan on 31/03/23.
//

import SwiftUI

struct TestView: View {
    var question: [Math]
    var isCircle: [[Bool]]
    var isSelected: [[Bool]]
    @Binding var answerCorrectly: [Bool?]
    var correctCount: Int {
        let correctOnly = answerCorrectly.filter {
            $0 == true
        }
        return correctOnly.count
    }
    
    var body: some View {
        var _ = print("Pindah Page bro")
        var _ = print(question)
        ZStack(alignment: .bottom) {
            VStack {
                Circle()
                    .foregroundColor(Color("water"))
            }
            .frame(width: 570)
            .offset(y: 380)
            
            
            VStack {
                VStack(spacing: 4.5) {
                    HStack(spacing: 4) {
                        NavigationLink(destination: SumQuestionPage(question: question, currentPageIndex: 0, isCircle: isCircle[0], isSelected: isSelected[0], answerCorrectly: $answerCorrectly)) {
                            RoundedRectangle(cornerRadius: 16)
                                .frame(width: 81, height: 81)
                                .foregroundColor(answerCorrectly[0]! ? Color("americanGreen") : Color("fireOpal"))
                        }
                        NavigationLink(destination: SumQuestionPage(question: question, currentPageIndex: 1, isCircle: isCircle[1], isSelected: isSelected[1], answerCorrectly: $answerCorrectly)) {
                            RoundedRectangle(cornerRadius: 16)
                                .frame(width: 81, height: 81)
                                .foregroundColor(answerCorrectly[1]! ? Color("americanGreen") : Color("fireOpal"))
                        }
                        NavigationLink(destination: SumQuestionPage(question: question, currentPageIndex: 2, isCircle: isCircle[2], isSelected: isSelected[2], answerCorrectly: $answerCorrectly)) {
                            RoundedRectangle(cornerRadius: 16)
                                .frame(width: 81, height: 81)
                                .foregroundColor(answerCorrectly[2]! ? Color("americanGreen") : Color("fireOpal"))
                        }
                        NavigationLink(destination: SumQuestionPage(question: question, currentPageIndex: 3, isCircle: isCircle[3], isSelected: isSelected[3], answerCorrectly: $answerCorrectly)) {
                            RoundedRectangle(cornerRadius: 16)
                                .frame(width: 81, height: 81)
                                .foregroundColor(answerCorrectly[3]! ? Color("americanGreen") : Color("fireOpal"))
                        }
                        
                    }
                    HStack(spacing: 4) {
                        NavigationLink(destination: SumQuestionPage(question: question, currentPageIndex: 4, isCircle: isCircle[4], isSelected: isSelected[4], answerCorrectly: $answerCorrectly)) {
                            RoundedRectangle(cornerRadius: 16)
                                .frame(width: 81, height: 81)
                                .foregroundColor(answerCorrectly[4]! ? Color("americanGreen") : Color("fireOpal"))
                        }
                        NavigationLink(destination: SumQuestionPage(question: question, currentPageIndex: 5, isCircle: isCircle[5], isSelected: isSelected[5], answerCorrectly: $answerCorrectly)) {
                            RoundedRectangle(cornerRadius: 16)
                                .frame(width: 81, height: 81)
                                .foregroundColor(answerCorrectly[5]! ? Color("americanGreen") : Color("fireOpal"))
                        }
                        NavigationLink(destination: SumQuestionPage(question: question, currentPageIndex: 6, isCircle: isCircle[6], isSelected: isSelected[6], answerCorrectly: $answerCorrectly)) {
                            RoundedRectangle(cornerRadius: 16)
                                .frame(width: 81, height: 81)
                                .foregroundColor(answerCorrectly[6]! ? Color("americanGreen") : Color("fireOpal"))
                        }
                        NavigationLink(destination: SumQuestionPage(question: question, currentPageIndex: 7, isCircle: isCircle[7], isSelected: isSelected[7], answerCorrectly: $answerCorrectly)) {
                            RoundedRectangle(cornerRadius: 16)
                                .frame(width: 81, height: 81)
                                .foregroundColor(answerCorrectly[7]! ? Color("americanGreen") : Color("fireOpal"))
                        }
                        
                    }
                    HStack(spacing: 4) {
                        NavigationLink(destination: SumQuestionPage(question: question, currentPageIndex: 8, isCircle: isCircle[8], isSelected: isSelected[8], answerCorrectly: $answerCorrectly)) {
                            RoundedRectangle(cornerRadius: 16)
                                .frame(width: 81, height: 81)
                                .foregroundColor(answerCorrectly[8]! ? Color("americanGreen") : Color("fireOpal"))
                        }
                        NavigationLink(destination: SumQuestionPage(question: question, currentPageIndex: 9, isCircle: isCircle[9], isSelected: isSelected[9], answerCorrectly: $answerCorrectly)) {
                            RoundedRectangle(cornerRadius: 16)
                                .frame(width: 81, height: 81)
                                .foregroundColor(answerCorrectly[9]! ? Color("americanGreen") : Color("fireOpal"))
                        }
                        NavigationLink(destination: SumQuestionPage(question: question, currentPageIndex: 10, isCircle: isCircle[10], isSelected: isSelected[10], answerCorrectly: $answerCorrectly)) {
                            RoundedRectangle(cornerRadius: 16)
                                .frame(width: 81, height: 81)
                                .foregroundColor(answerCorrectly[10]! ? Color("americanGreen") : Color("fireOpal"))
                        }
                        NavigationLink(destination: SumQuestionPage(question: question, currentPageIndex: 11, isCircle: isCircle[11], isSelected: isSelected[11], answerCorrectly: $answerCorrectly)) {
                            RoundedRectangle(cornerRadius: 16)
                                .frame(width: 81, height: 81)
                                .foregroundColor(answerCorrectly[11]! ? Color("americanGreen") : Color("fireOpal"))
                        }
                        
                    }
                }
                .padding(.top, 38)
                
                Spacer()
                
                VStack(spacing: 7) {
                    Text(summaryHeadline())
                        .font(.system(size: 36, weight: .heavy, design: .rounded))
                    Text(summarySubheadline())
                        .font(.system(size: 18, weight: .bold, design: .rounded))
                }
                
                Spacer()
                
                Image(pickSummaryAvatar())
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(minWidth: 320, idealWidth: 320, maxWidth: 320, minHeight: 280, idealHeight: 280, maxHeight: 280, alignment: .center)
                    .padding(.horizontal, 33)
                    .ignoresSafeArea()
                    .offset(y: 35)
            }
        }
        .navigationBarTitle("Ringkasan")
        .navigationBarBackButtonHidden(true)
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                NavigationLink {
                    HomeView()
                } label: {
                    Text("Selesai")
                }
            }
        }
}

func summaryHeadline() -> String {
    if correctCount == 12 {
        return "Sangat Baik"
    } else if correctCount >= 10 {
        return "Cukup Baik"
    } else {
        return "Kurang Baik"
    }
}

func summarySubheadline() -> String {
    if correctCount == 12 {
        return "Selamat! Pertahankan cara berlatihmu."
    } else if correctCount >= 10 {
        return "Akan lebih baik jika kamu terus berlatih."
    } else {
        return "Kamu perlu berlatih lagi, semangat!"
    }
}

func pickSummaryAvatar() -> String {
    if correctCount == 12 {
        return "girl-wow-illlustration"
    } else if correctCount >= 10 {
        return "girl-smile-illlustration"
    } else {
        return "girl-tongue-illlustration"
    }
}
}

struct TestView_Previews: PreviewProvider {
    static var previews: some View {
        TestView(question: [Math(), Math(), Math(), Math(), Math(), Math(), Math(), Math(), Math(), Math(), Math(), Math()], isCircle: [[false, false, false, true], [false, false, false, true],[false, false, false, true],[false, false, false, true],[false, false, false, true],[false, false, false, true],[false, false, false, true],[false, false, false, true],[false, false, false, true],[false, false, false, true],[false, false, false, true],[false, false, false, true]], isSelected: [[false, false, false, true],[false, false, false, true],[false, false, false, true],[false, false, false, true],[false, false, false, true],[false, false, false, true],[false, false, false, true],[false, false, false, true],[false, false, false, true],[false, false, false, true],[false, false, false, true],[false, false, false, true]], answerCorrectly: .constant([true, true, true, true, false, false, true, true, true, true, true, true]))
    }
}
