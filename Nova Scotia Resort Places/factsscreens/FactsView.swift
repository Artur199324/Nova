//
//  FactsView.swift
//  Nova Scotia Resort Places
//
//  Created by Artur on 04.10.2024.
//

import SwiftUI

struct FactsView: View {
    @State private var number = 0
    @State var settings = false
    @State var detailFacrs = false
    var body: some View {
        VStack{
            HStack{
                Image("Facts").padding(.leading,30)
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
                    detailFacrs.toggle()
                }, label: {
                    Image("f1")
                })
                Button(action: {
                    number = 1
                    detailFacrs.toggle()
                }, label: {
                    Image("f2")
                })
                Button(action: {
                    detailFacrs.toggle()
                    number = 2
                }, label: {
                    Image("f3")
                })
            }
        }.frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/,maxHeight: .infinity)
            .background(Color("Color2").ignoresSafeArea())
            .fullScreenCover(isPresented: $settings, content: {
                SetingsScrensView()
            })
            .fullScreenCover(isPresented: $detailFacrs, content: {
                DetailsIFactView(number: $number)
            })
    }
}

#Preview {
    FactsView()
}
