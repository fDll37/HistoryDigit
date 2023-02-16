//
//  NumberAPI.swift
//  HistoryDigit
//
//  Created by Данил Менделев on 07.02.2023.
//

import Foundation

enum TypeAPI {
    
    case math(query: String)
    case trivia(query: String)
    case date(query: String)
    case year(query: String)
    
    var baseURL: String {"http://numbersapi.com/"}
    
    var path: String {
        
        switch self {
        case .math: return "math"
        case .date: return "date"
        case .year: return "year"
        case .trivia: return "trivia"
        }
    }
    
    var request: URLRequest {
        var request = URLRequest(url: self.fullURL)
        request.httpMethod = "GET"
        return request
    }
    
    var fullURL: URL {
        
        var url = self.baseURL
        
        switch self {
            
        case .math(let query):
            
            let percentEncodedString = query.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) ?? query
            url += "\(percentEncodedString)/"
            
        case .trivia(let query):
            
            let percentEncodedString = query.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) ?? query
            url += "\(percentEncodedString)/"
            
        case .date(let query):
            
            let percentEncodedString = query.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) ?? query
            url += "\(percentEncodedString)/"
            
        case .year(let query):
            
            let percentEncodedString = query.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) ?? query
            url += "\(percentEncodedString)/"
        }
        
        url += self.path
        url += "?json"
        return URL(string: url)!
    }
}




class NumberAPI {
    
    static let shared = NumberAPI()
    
    private let session = URLSession.shared
    private let jsonDecoder: JSONDecoder = {
        let decoder = JSONDecoder()
        decoder.dateDecodingStrategy = .iso8601
        return decoder
    }()
    
    
    func getMath(query: String, completion: @escaping (Number)-> Void ) {
        let request = TypeAPI.math(query: <#T##String#>)
    }
    
    func getTrivia() {
        
    }
    
    func detDate() {
        
    }
    
    func getRandom() {
        
    }
    
}

//var ff = TypeAPI.year(query: "1992").fullURL
//print(ff)
//
//var url: TypeAPI = .math(query: "42")
//var full = url.fullURL
//print(full)


let number = 10

switch number {
case 10:
    print("10")
    fallthrough
case 12:
    print("12")
default:
    print("default")
}
