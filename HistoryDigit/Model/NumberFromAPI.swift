//
//  NumberFromAPI.swift
//  HistoryDigit
//
//  Created by Данил Менделев on 07.02.2023.
//

import Foundation
import SwiftUI

struct NumberFromAPI: Codable {
    
    let text: String
    let found: Bool
    let number: Int?
    let type: String?
    let date: String?
    let year: Int?

}

class FilterSearch {

    static let shared = FilterSearch()
    
    var result: TypeNumber = .math
    
    private init() {}
    
    func setResult(type: TypeNumber) {
        self.result = type
    }
    
    func getResult() -> TypeNumber {
        return self.result
    }
}

enum TypeNumber: Equatable {
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


// text: A string of the fact text itself.
//found: Boolean of whether there was a fact for the requested number.
//number: The floating-point number that the fact pertains to. This may be useful for, eg. a /random request or not found=floor. For a date fact, this is the 1-indexed day of a leap year (eg. 61 would be March 1st).
//type: String of the category of the returned fact.
//date (sometimes): A day of year associated with some year facts, as a string.
//year (sometimes): A year associated with some date facts, as a string.

