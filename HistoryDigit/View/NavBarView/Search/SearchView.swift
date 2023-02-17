//
//  SearchView.swift
//  HistoryDigit
//
//  Created by Данил Менделев on 08.02.2023.
//

import SwiftUI

struct SearchView: View {
    
    @State private var filter = FilterSearch.shared
    @State private var fullText: String = "TEXT"
    
    var body: some View {
        NavigationView {
            
            VStack {
                Text("Поиск числа")
                    .font(.title)
                    .font(.system(size: 50))
                    .fontWeight(.heavy)
                    .padding()
                Text("Чтобы найти число введите его в круге")
                Spacer()
                ZStack {
                    AnimationView()
                    
                    TextEditor(text: $fullText)
                        .keyboardType(.numberPad)
                        .font(.system(size: 50))
                        .frame(width: 150, height: 75, alignment: .center)
                        .fontWeight(.heavy)
                }
                .frame(width: 400, height: 400, alignment: .center)
                
                Spacer()
                
                Button(action: {
                }, label: {
                    NavigationLink(destination: ResultSearchView(text: $fullText, filter: $filter)) {
                        Text("SEARCH")
                    }
                })
                .background(.indigo)
                .foregroundColor(.black)
                .fontWeight(.heavy)
                .cornerRadius(15)
                .font(.system(size: 35))
                Spacer()
                    .onAppear() {
                        filter.getResult()
                    }
            }
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    NavigationLink(destination: FilterView()) {
                        HStack {
                            Image(systemName: "line.3.horizontal.decrease.circle")
                        }
                    }
                }
            }
        }

    }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView()
    }
}
