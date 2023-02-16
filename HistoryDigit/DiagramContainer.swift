//
//  DiagramContainer.swift
//  HistoryDigit
//
//  Created by Данил Менделев on 16.02.2023.
//

import Foundation
import CoreData
import SwiftUI

class DiagramContainer: ObservableObject {
    
    @Published var charData = [
        PieceOfDiagram(color: .blue, percent: 0, value: 0, type: "math"),
        PieceOfDiagram(color: .orange, percent: 0, value: 0, type: "trivia"),
        PieceOfDiagram(color: .red, percent: 0, value: 0, type: "date"),
        PieceOfDiagram(color: .green, percent: 0, value: 0, type: "year")
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
