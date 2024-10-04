//
//  HotelsAllView.swift
//  Nova Scotia Resort Places
//
//  Created by Artur on 04.10.2024.
//

import SwiftUI

struct HotelsAllView: View {

    @State private var number = 0
    @State var settings = false
    @State var detail = false
    
   
   
    var body: some View {
        VStack{
            
            HStack{
             
                Image("Hotels").padding(.leading,30)
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
                    detail.toggle()
                }, label: {
                    Image("hotel1 1")
                })
                
                Button(action: {
                    number = 1
                    detail.toggle()
                }, label: {
                    Image("hotel2 1")
                }).padding(.top)
                Button(action: {
                    number = 2
                    detail.toggle()
                }, label: {
                    Image("hotel3")
                }).padding(.top)
                
            
                Button(action: {
                    number = 3
                    detail.toggle()
                }, label: {
                    Image("hotel5")
                }).padding(.top)
                Button(action: {
                    number = 4
                    detail.toggle()
                }, label: {
                    Image("hotel6")
                }).padding(.top)
                
            }
        }.frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/,maxHeight: .infinity)
            .background(Image("main screen").ignoresSafeArea())
            .fullScreenCover(isPresented: $settings, content: {
                SetingsScrensView()
            })
            .fullScreenCover(isPresented: $detail, content: {
                DetailsIView(number: $number)
            })
    }
}

#Preview {
    HotelsAllView()
}
