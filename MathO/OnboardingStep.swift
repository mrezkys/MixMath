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
    OnboardingStep(image: "splashImage", title: "Bermain dan Belajar", description: "Belajar matematika jadi menyenangkan dengan aplikasi Math’O! Rasakan sensasi main game, dan belajar matematika sekaligus!"),
    OnboardingStep(image: "splashImage",title: "Solusi Pengerjaan Kompleks", description: "Kami tawarkan solusi matematika yang kompleks dalam pengalaman belajar yang mudah dan menyenangkan untuk anak-anak."),
]
