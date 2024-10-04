//
//  ContentView.swift
//  Nova Scotia Resort Places
//
//  Created by Artur on 04.10.2024.
//

import SwiftUI

struct ContentView: View {
    @State var start = false
    @State var isStart = false
    @State var isPresent = false
    
    let termsofUse =  "https://sites.google.com/view/terms-and-conditions-last-upda/"
    let privacyPolicy  = "https://www.termsfeed.com/live/fc9aaf9f-3289-43ed-aca1-7cd558516d0d"
    @State var link = ""
    private let requst = RequestAppReview()
    var body: some View {
        ZStack {
            if isStart{
                Button {
                    start.toggle()
                } label: {
                    Image("Frame 5")
                }.padding(.top,620)
                
            }else{
                HStack{
                    Button {
                        link = termsofUse
                        isPresent.toggle()
                    } label: {
                        Image("terms")
                    }.padding(.trailing)
                    
                    Button {
                        link = privacyPolicy
                        isPresent.toggle()
                    } label: {
                        Image("privacy")
                    }.padding(.leading,5)
                }.padding(.top,730)
            }
        }
        .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/,maxHeight: .infinity)
        .background(Image(isStart ? "onboarding" : "launch gray").ignoresSafeArea())
        .fullScreenCover(isPresented: $start, content: {
            MainScreensIView()
        })
        .onAppear {
        
            DispatchQueue.main.asyncAfter(deadline: .now() + 4) {
                isStart = true
            }
        }.overlay {
            if isPresent{
                NavigationView {
                    PolisiPropertiView(url: URL(string: link)!)
                        .navigationBarTitleDisplayMode(.inline)
                        .navigationBarItems(trailing: Button(action: {
                            isPresent.toggle()
                        }) {
                            Text("Close")
                        })
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
