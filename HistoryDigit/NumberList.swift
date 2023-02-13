//
//  NumberList.swift
//  HistoryDigit
//
//  Created by Данил Менделев on 13.02.2023.
//

import Foundation

class NumberList: ObservableObject {
    @Published var listNumber: [SaveNumber] = []
    
    init() {
        print("Documents directory is: \(documentsDirectory())")
        print("Data file path is: \(dataFilePath())")
        loadListItems()
    }
    
    func printChecklistContents() {
        for item in listNumber {
            print(item)
        }
    }
    
    func deleteListItem(whichElement: IndexSet) {
        listNumber.remove(atOffsets: whichElement)
        saveListItems()
    }
    
    func moveListItem(whichElement: IndexSet, destination: Int) {
        listNumber.move(fromOffsets: whichElement, toOffset: destination)
        saveListItems()
    }
    
    func documentsDirectory() -> URL {
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        return paths[0]
    }
    
    func dataFilePath() -> URL {
        return documentsDirectory().appendingPathComponent("ListElement.plist")
    }
    
    func saveListItems() {
        // 1
        let encoder = PropertyListEncoder()
        // 2
        do {
            // 3
            let data = try encoder.encode(listNumber)
            // 4
            try data.write(to: dataFilePath(), options: Data.WritingOptions.atomic)
            // 5
        } catch { // 6
            print("Error encoding item array: \(error.localizedDescription)")
        }
    }
    
    func loadListItems() {
        // 1
        let path = dataFilePath()
        // 2
        if let data = try? Data(contentsOf: path) {
            // 3
            let decoder = PropertyListDecoder()
            do {
                // 4
                listNumber = try decoder.decode([SaveNumber].self,from: data)
                // 5
            } catch {
                print("Error decoding item array: \(error.localizedDescription)")
            }
            
        }
    }
    
}

