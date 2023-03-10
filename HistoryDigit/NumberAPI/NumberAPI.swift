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
    case random
    
    var baseURL: String {"http://numbersapi.com/"}
    
    var path: String {
        
        switch self {
        case .math: return "math"
        case .date: return "date"
        case .year: return "year"
        case .trivia: return "trivia"
        case .random: return "random"
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
            
        case .random:
            url += ""
        }
        
        url += self.path
        url += "?json"
        return URL(string: url)!
    }
}




class NumberAPI {
    
    static let shared = NumberAPI()
    static var number: Number?
    
    private let session = URLSession.shared
    private let jsonDecoder: JSONDecoder = {
        let decoder = JSONDecoder()
        decoder.dateDecodingStrategy = .iso8601
        return decoder
    }()
    
    
    func getMath(query: String, completion: @escaping (NumberFromAPI)-> Void ) {
        let request = TypeAPI.math(query: query).request
        self.session.dataTask(with: request) { data, response, error in
            if error == nil {
                do {
                    let number = try NumberAPI.shared.jsonDecoder.decode(NumberFromAPI.self, from: data!)
                    DispatchQueue.main.async {
                        completion(number)
                    }
                } catch {
                    print(error)
                    print("JSON Error (MATH)")
                }
                
            }
            
        }.resume()
    }
    
    func getTrivia(query: String, completion: @escaping (NumberFromAPI)-> Void ) {
        let request = TypeAPI.trivia(query: query).request
        self.session.dataTask(with: request) { data, response, error in
            if error == nil {
                do {
                    let number = try NumberAPI.shared.jsonDecoder.decode(NumberFromAPI.self, from: data!)
                    DispatchQueue.main.async {
                        completion(number)
                    }
                } catch {
                    print(error)
                    print("JSON Error (TRIVIA)")
                }
            }
            
        }.resume()
    }
    
    func getDate(query: String, completion: @escaping (NumberFromAPI)-> Void) {
        let request = TypeAPI.date(query: query).request
        self.session.dataTask(with: request) { data, response, error in
            if error == nil {
                do {
                    let number = try NumberAPI.shared.jsonDecoder.decode(NumberFromAPI.self, from: data!)
                    DispatchQueue.main.async {
                        completion(number)
                    }
                } catch {
                    print(error)
                    print("JSON Error (DATE)")
                }
            }
            
        }.resume()
    }
    
    func getYear(query: String, completion: @escaping (NumberFromAPI)-> Void) {
        let request = TypeAPI.year(query: query).request
        self.session.dataTask(with: request) { data, response, error in
            if error == nil {
                do {
                    let number = try NumberAPI.shared.jsonDecoder.decode(NumberFromAPI.self, from: data!)
                    DispatchQueue.main.async {
                        completion(number)
                    }
                } catch {
                    print(error)
                    print("JSON Error (YEAR)")
                }
            }
            
        }.resume()
    }
    
    func getRandom(completion: @escaping (NumberFromAPI)-> Void) {
        let request = TypeAPI.random.request
        self.session.dataTask(with: request) { data, response, error in
            if error == nil {
                do {
                    let number = try NumberAPI.shared.jsonDecoder.decode(NumberFromAPI.self, from: data!)
                    DispatchQueue.main.async {
                        completion(number)
                    }
                } catch {
                    print(error)
                    print("JSON Error (RANDOM)")
                }
            }
            
        }.resume()
    }
    
}
