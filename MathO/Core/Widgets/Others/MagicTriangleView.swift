//
//  MagicTriangleView.swift
//  MixMath
//
//  Created by Muhammad Rezky on 30/10/24.
//

import SwiftUI

struct MagicTriangleView: View {
    var operation: String
    var isParenthesis: Bool
    
    var body: some View {
        VStack {
            Text("Segitiga Ajaib")
                .font(.system(size: 18, design: .rounded))
                .bold()
            
            Image(getImage())
                .resizable()
                .frame(width: 228, height: 228)
            
            Text(getDescription())
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

    func getDescription() -> String {
        let ops = operation.components(separatedBy: " ")[1]
        
        if isParenthesis {
            return NSLocalizedString(
                "Berdasarkan segitiga ajaib di atas, dapat dilihat bahwa operasi yang berada pada tanda buka kurung dan tutup kurung adalah operasi yang harus didahulukan dalam operasi campuran matematika. Untuk menyelesaikan perhitungan di dalam tanda buka kurung dan tutup kurung, kita melihat kembali di segitiga ajaib bahwa yang pertama harus dikerjakan adalah perkalian dan pembagian, kemudian dilanjutkan dengan penjumlahan dan pengurangan",
                comment: "Description for operations inside parentheses"
            )
        }
        
        switch ops {
        case "x":
            return NSLocalizedString(
                "Berdasarkan segitiga ajaib di atas, dapat dilihat bahwa perkalian merupakan operasi kedua yang harus didahulukan dalam operasi campuran matematika.",
                comment: "Description for multiplication"
            )
        case ":":
            return NSLocalizedString(
                "Berdasarkan segitiga ajaib di atas, dapat dilihat bahwa pembagian merupakan operasi ketiga yang harus didahulukan dalam operasi campuran matematika.",
                comment: "Description for division"
            )
        case "+":
            return NSLocalizedString(
                "Berdasarkan segitiga ajaib di atas, dapat dilihat bahwa penjumlahan merupakan operasi keempat yang harus didahulukan dalam operasi campuran matematika.",
                comment: "Description for addition"
            )
        case "-":
            return NSLocalizedString(
                "Berdasarkan segitiga ajaib di atas, dapat dilihat bahwa pengurangan merupakan operasi kelima yang harus didahulukan dalam operasi campuran matematika.",
                comment: "Description for subtraction"
            )
        default:
            return NSLocalizedString(
                "Berdasarkan segitiga ajaib di atas, dapat dilihat bahwa parenthesis merupakan operasi pertama yang harus didahulukan dalam operasi campuran matematika.",
                comment: "Fallback description for mixed operations"
            )
        }
    }

    func getImage() -> String {
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

}
