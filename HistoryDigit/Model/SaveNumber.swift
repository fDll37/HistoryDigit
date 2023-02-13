//
//  SaveNumber.swift
//  HistoryDigit
//
//  Created by Данил Менделев on 08.02.2023.
//

import Foundation

struct SaveNumber: Codable, Identifiable {
    
    var id = UUID()
    let number: Int
    let text: String
    let type: String
}

enum TypeNumber {
    case math
    case trivia
    case date
    case year
    
    var value: String {
        
        switch self {
        case .math: return "math"
        case .date: return "date"
        case .year: return "year"
        case .trivia: return "trivia"
        }
    }
}
