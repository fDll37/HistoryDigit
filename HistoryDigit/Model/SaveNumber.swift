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
    let date: String?
    let year: String?
}
