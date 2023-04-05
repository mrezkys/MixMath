//
//  OnboardingStep.swift
//  MathO
//
//  Created by Vincent Gunawan on 29/03/23.
//

import Foundation

struct OnboardingStep {
    let image: String
    let title: String
    let description: String
}

let onBoardingSteps: [OnboardingStep] = [
    OnboardingStep(image: "boy-presenting-illustration", title: "Selamat datang!", description: "Sudah siap belajar mengenai operasi hitung campuran?"),
    OnboardingStep(image: "girl-presenting-illustration",title: "Sudah belajar soal-soal di atas?", description: "Sebelum mulai belajar operasi hitung campuran, kamu perlu menguasai operasi hitung dasar."),
]
