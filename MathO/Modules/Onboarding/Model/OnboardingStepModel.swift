//
//  OnboardingStepModel.swift
//  MixMath
//
//  Created by Muhammad Rezky on 12/10/24.
//

import Foundation

struct OnboardingStepModel {
    let image: String
    let title: String
    let description: String
}

let onboardingStepsData: [OnboardingStepModel] = [
    OnboardingStepModel(
        image: "boy-presenting-illustration",
        title: "Selamat datang!", 
        description: "Sudah siap belajar mengenai operasi hitung campuran?"
    ),
    OnboardingStepModel(
        image: "girl-presenting-illustration",
        title: "Sudah belajar soal-soal di atas?",
        description: "Sebelum mulai belajar operasi hitung campuran, kamu perlu menguasai operasi hitung dasar."
    ),
]

