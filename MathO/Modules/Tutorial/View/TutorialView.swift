//
//  TutorialView.swift
//  MathO
//
//  Created by Muhammad Rezky on 04/04/23.
//

import SwiftUI

struct TutorialView: View {
    @StateObject var vm: TutorialViewModel = TutorialViewModel()

    var body: some View {
        VStack {
            if vm.showDisplayText {
                Text(vm.displayText)
                    .padding(.horizontal, 32)
                    .font(.system(size: 24, weight: .bold))
                    .multilineTextAlignment(.center)
                    .frame(maxWidth: .infinity, maxHeight: 240)
                    .background(Color("celestialBlue"))
                    .cornerRadius(24)
                    .padding([.top, .leading, .trailing], 24)
                    .foregroundColor(.white)
            } else {
                Text(vm.question)
                    .padding(.horizontal, 32)
                    .font(.system(size: 500, weight: .bold))
                    .lineLimit(1)
                    .minimumScaleFactor(0.01)
                    .frame(maxWidth: .infinity, maxHeight: 240)
                    .background(Color("celestialBlue"))
                    .cornerRadius(24)
                    .padding([.top, .leading, .trailing], 24)
                    .foregroundColor(.white)
            }

            VStack(spacing: 16) {
                ForEach(0..<2) { row in
                    HStack(spacing: 16) {
                        ForEach(0..<2) { col in
                            let index = (row * 2) + col
                            AnswerButtonRevamp(
                                generatedNumber: vm.choices[index],
                                state: vm.answerStates[index]
                            ) {
                                vm.handleAnswerSelection(at: index)
                            }
                        }
                    }
                }
            }
            .padding(.top, 32)
            Spacer()
            Image("book-illustration")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(maxWidth: .infinity)
                .padding(.horizontal, 42)
        }
        .padding(.top, 36)
        .navigationBarTitle("Mari Berhitung 🤓")
        .navigationBarItems(
            trailing: Button(action: { vm.isFinishTutorial.toggle() }) {
                Text("Selesai")
            }
                .disabled(vm.answerStates.allSatisfy { $0 == .unselected })
        )
        .onAppear {
            DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
                vm.showDisplayText = false
            }
        }

        NavigationLink(destination: TutorialFinishView(), isActive: $vm.isFinishTutorial) {
            EmptyView()
        }
    }
}



struct TutorialView_Previews: PreviewProvider {
    static var previews: some View {
        TutorialView()
    }
}
