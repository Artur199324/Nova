//
//  QuizView.swift
//  Nova Scotia Resort Places
//
//  Created by Artur on 04.10.2024.
//

import SwiftUI

struct QuizView: View {
    @State var settings = false
    @State var game = false
    var body: some View {
        VStack{
            HStack{
                Image("Quiz").padding(.leading,30)
                Spacer()
                Button {
                    settings.toggle()
                    
                } label: {
                    Image("seetings")
                }.padding(.trailing,30)
               
            }
            
            ScrollView{
                Button(action: {
                    game.toggle()
                }, label: {
                    Image("Frame 36")
                }).padding(.top)
            }
        }.frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/,maxHeight: .infinity)
            .background(Color("Color2").ignoresSafeArea())
            .fullScreenCover(isPresented: $settings, content: {
                SetingsScrensView()
            })
            .fullScreenCover(isPresented: $game, content: {
                GameQuizView()
            })
    }
    

    

}

#Preview {
    QuizView()
}
