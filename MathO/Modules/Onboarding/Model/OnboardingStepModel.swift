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
        title: NSLocalizedString("Selamat datang!", comment: "Welcome message for onboarding"),
        description: NSLocalizedString("Sudah siap belajar mengenai operasi hitung campuran?", comment: "Question to engage user readiness")
    ),
    OnboardingStepModel(
        image: "girl-presenting-illustration",
        title: NSLocalizedString("Sudah belajar soal-soal di atas?", comment: "Question about prior exercises"),
        description: NSLocalizedString("Sebelum mulai belajar operasi hitung campuran, kamu perlu menguasai operasi hitung dasar.", comment: "Reminder to master basic arithmetic first")
    )
]

