# MixMath: Mixed Operations Game

## About
MixMath: Mixed Operations Game is an educational app specially designed for elementary school children who want to learn mixed math operations in a fun and interactive way. Built using Swift and SwiftUI for iPhone.

[App Store Link](https://apps.apple.com/sa/app/mixmath-mixed-operations-game/id6737522445?uo=2)

## Screenshots
![Github Shot - MixMath](https://github.com/user-attachments/assets/0adfdbb3-3546-4e4d-98bf-c2c82dce0b1b)


## Project Structure

```
MixMath/
├── MixMath.xcodeproj/        # Xcode project files
└── MathO/                    # Main app directory
    ├── App/                  # App configuration and resources
    │   ├── MathOApp.swift    # App entry point
    │   ├── ContentView.swift # Main content view
    │   ├── Resources/        # Assets and resources
    │   └── Theme/            # App theming
    ├── Core/                 # Core functionality
    │   ├── Logic/            # Business logic
    │   │   └── Math/         # Math operations logic
    │   │       ├── Model/
    │   │       ├── Generator/
    │   │       └── Formatter/
    │   ├── Services/         # App services
    │   ├── Utilities/        # Utility helpers
    │   └── Widgets/          # Reusable UI components
    │       ├── AnswerButton/
    │       ├── AnswerButtonGrid/
    │       ├── AnswerProgressBar/
    │       └── Others/
    ├── Modules/              # App feature modules
    │   ├── Home/             # Home screen
    │   ├── Onboarding/       # User onboarding
    │   ├── Question/         # Questions and answers
    │   ├── Splash/           # Splash screen
    │   └── Tutorial/         # Tutorials
    ├── Info.plist            # App configuration
    └── Preview Content/      # SwiftUI preview assets
```

### Key Features
- Interactive math problems with mixed operations (+, -, ×, ÷)
- Step-by-step solutions
- Tutorial mode for beginners
- Engaging interface designed for elementary school children
- Progressive difficulty levels

### Technology
- **Platform**: iOS
- **Framework**: SwiftUI
- **Language**: Swift
- **Architecture**: MVVM (Model-View-ViewModel) 
