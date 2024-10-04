//
//  GameQuizView.swift
//  Nova Scotia Resort Places
//
//  Created by Artur on 06.10.2024.
//

import SwiftUI

struct GameQuizView: View {
    @State private var questions = Questions()
    @Environment(\.dismiss) var dismiss
    @State private var numberQwer = 0
    @State private var time = 45
    @State private var count = 0
    @State private var wrong = 0
    @State private var one = false
    @State private var two = false
    @State private var thre = false
    
    @State private var one2 = false
    @State private var two2 = false
    @State private var thre2 = false
    
    @State private var one3 = false
    @State private var two3 = false
    @State private var thre3 = false
    
    @State private var one4 = false
    @State private var two4 = false
    @State private var thre4 = false
    @State private var timerRunning = false
    @State private var timer: Timer?
    var body: some View {
        VStack{
            HStack{
                Button {
                    self.dismiss()
                } label: {
                    Image("Frame 40")
                }.padding(.leading)
                
                Image("Quiz").padding(.leading,15)
                Spacer()
              
                
            }
            
            Image("Frame 66").padding(.top)
                .overlay {
                    HStack{
                        Text("Question \(numberQwer+1) / 10")
                            .foregroundColor(.white)
                            .padding(.leading)
                        Spacer()
                        Text("\(time)") .foregroundColor(.white)
                            .padding(.trailing)
                    }
                }
            ScrollView{
                Image(questions.imgQ[numberQwer])
                Text("\(questions.questtion[numberQwer])")
                    .foregroundColor(.white)
                    .font(.title)
                    .multilineTextAlignment(.center)
                    .padding(30)
                    .background(Color("Color3"))
                    .cornerRadius(20)
                    .padding(.top, 40)
                    .padding(.horizontal)
                
                HStack {
                    buttonWithDelay(index: 0, one: $one, two: $two, three: $thre)
                    buttonWithDelay(index: 1, one: $one2, two: $two2, three: $thre2)
                }
                
                HStack {
                    buttonWithDelay(index: 2, one: $one3, two: $two3, three: $thre3)
                    buttonWithDelay(index: 3, one: $one4, two: $two4, three: $thre4)
                }
            }
            
        }.frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/,maxHeight: .infinity)
            .background(Color("Color2").ignoresSafeArea())
            .onAppear{
                startTimer()
            }
            .overlay {
                if time == 0 || numberQwer == 9 {
                    VStack{
                        Image("Frame 67")
                            .overlay {
                                Button(action: {
                                    self.dismiss()
                                }, label: {
                                    Image("Frame 6")
                                        .padding(.top,100)
                                })
                            }
                    }
                }
            }
    }
    
    func startTimer() {
        guard !timerRunning else { return }
        timerRunning = true
        timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { timer in
            if time > 0 {
                time -= 1
            } else {
                timer.invalidate()
                timerRunning = false
            }
        }
    }
    
    func stopTimer() {
        timer?.invalidate()
        timer = nil
        timerRunning = false
    }
    
    func getBackgroundColor(index: Int, one: Binding<Bool>, two: Binding<Bool>, three: Binding<Bool>) -> Color {
        if one.wrappedValue {
            return Color("Color4")
        } else if two.wrappedValue {
            return Color("Color6")
        } else if three.wrappedValue {
            return Color("Color5")
        } else {
            return Color("Color3")
        }
    }
    
    func buttonWithDelay(index: Int, one: Binding<Bool>, two: Binding<Bool>, three: Binding<Bool>) -> some View {
        Button(action: {
            one.wrappedValue.toggle()
            DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                if questions.wrong[numberQwer] == index + 1 {
                    two.wrappedValue.toggle()
                    one.wrappedValue.toggle()
                    wrong += 1
                } else {
                    three.wrappedValue.toggle()
                    one.wrappedValue.toggle()
                }
                DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                    if questions.wrong[numberQwer] == index + 1 {
                        two.wrappedValue.toggle()
                    } else {
                        three.wrappedValue.toggle()
                    }
                    if numberQwer < questions.wrong.count - 1 {
                        numberQwer += 1
                    }
                }
            }
        }, label: {
            Text("\(questions.answer[numberQwer][index])")
                .foregroundColor(.white)
                .font(.title3)
                .multilineTextAlignment(.center)
                .padding(30)
        })
        .frame(width: 180, height: 100)
        .background(getBackgroundColor(index: index, one: one, two: two, three: three))
        .cornerRadius(20)
    }
}

#Preview {
    GameQuizView()
}
