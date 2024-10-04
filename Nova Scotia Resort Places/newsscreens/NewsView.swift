//
//  NewsView.swift
//  Nova Scotia Resort Places
//
//  Created by Artur on 04.10.2024.
//

import SwiftUI

struct NewsView: View {
    @State private var number = 0
    @State var settings = false
    @State var detailNews = false
    var body: some View {
        VStack{
            HStack{
                Image("News").padding(.leading,30)
                Spacer()
                Button {
                    settings.toggle()
                    
                } label: {
                    Image("seetings")
                }.padding(.trailing,30)
               
            }
            ScrollView{
                Button(action: {
                    number = 0
                    detailNews.toggle()
                }, label: {
                    Image("n1")
                })
                Button(action: {
                    number = 1
                    detailNews.toggle()
                }, label: {
                    Image("n2")
                })
                Button(action: {
                    number = 2
                    detailNews.toggle()
                }, label: {
                    Image("n3")
                })
            }
            
        }.frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/,maxHeight: .infinity)
            .background(Color("Color2").ignoresSafeArea())
            .fullScreenCover(isPresented: $settings, content: {
                SetingsScrensView()
            })
            .fullScreenCover(isPresented: $detailNews, content: {
                DetailsINewsViewView(number: $number)
            })
    }
}

#Preview {
    NewsView()
}
