//
//  DiagramContainer.swift
//  HistoryDigit
//
//  Created by Данил Менделев on 16.02.2023.
//

import Foundation
import SwiftUI
import CoreData

struct PieceOfDiagram {
    let id = UUID()
    let color: Color
    var percent: CGFloat
    var value: CGFloat
    var type: String
}


class DiagramContainer: ObservableObject {
    
    @Published var charData = [
        PieceOfDiagram(color: Color(#colorLiteral(red: 0.5725490451, green: 0, blue: 0.2313725501, alpha: 1)), percent: 0, value: 0, type: "math"),
        PieceOfDiagram(color: Color(#colorLiteral(red: 0.2196078449, green: 0.007843137719, blue: 0.8549019694, alpha: 1)), percent: 0, value: 0, type: "trivia"),
        PieceOfDiagram(color: Color(#colorLiteral(red: 0.1960784346, green: 0.3411764801, blue: 0.1019607857, alpha: 1)), percent: 0, value: 0, type: "date"),
        PieceOfDiagram(color: Color(#colorLiteral(red: 0.9372549057, green: 0.3490196168, blue: 0.1921568662, alpha: 1)), percent: 0, value: 0, type: "year")
    ]
    
    func calcOfPathDiagram(numbers: FetchedResults<Number>) {
        var arrayPercent: [String: Int] = [
            "math": 0,
            "trivia": 0,
            "date": 0,
            "year": 0
        ]
        
        for number in numbers {
            switch number.type {
            case "math":
                arrayPercent["math"]! += 1
            case "trivia":
                arrayPercent["trivia"]! += 1
            case "date":
                arrayPercent["date"]! += 1
            case "year":
                arrayPercent["year"]! += 1
            default:
                print(number.type!)
            }
        }

        let countNumber = numbers.count
        var value: CGFloat = 0
        for index in 0..<charData.count {
            charData[index].percent = CGFloat(Double(arrayPercent[charData[index].type]! * 100) / Double(countNumber))
            value += charData[index].percent
            charData[index].value = value
        }
    }
    
}
