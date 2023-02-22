//
//  AboutMe.swift
//  HistoryDigit
//
//  Created by Данил Менделев on 11.02.2023.
//

import SwiftUI

struct AboutMeView: View {
    
    @StateObject var modelGit = WebViewModel(insideUrl: "https://github.com/fDll37/HistoryDigit/")
    @StateObject var modelTelegram = WebViewModel(insideUrl: "https://t.me/fDll37")
    
    var body: some View {
        NavigationView {
            VStack {
                Spacer()
                Text("О разработчике:")
                    .font(.system(size: 30))
                    .font(.title)
                
                Spacer()
                
                Image("me")
                    .resizable()
                    .clipShape(Circle())
                    .overlay(Circle().stroke(Color.blue, lineWidth: 5))
                    .scaledToFit()
                    .padding()
                    .shadow(color: .black, radius: 10)
                
                
                Button {
                } label: {
                    NavigationLink {
                        WebView(webView: modelGit.webView)
                    } label: {
                        Text("Ссылка на Git проекта")
                    }
                    .foregroundColor(.white)
                }
                .buttonStyle(.borderedProminent)
                
                Button {
                } label: {
                    NavigationLink {
                        WebView(webView: modelTelegram.webView)
                    } label: {
                        Text("Ссылка на Telegram разработчика")
                    }
                    .foregroundColor(.white)
                }
                .buttonStyle(.borderedProminent)
                
                Spacer()
                
                Rectangle()
                    .frame(width: 200, height: 200, alignment: .center)
            }
        }

    }
}

struct AboutMe_Previews: PreviewProvider {
    static var previews: some View {
        AboutMeView()
    }
}
