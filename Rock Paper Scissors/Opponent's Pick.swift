//
//  Opponent's Pick.swift
//  Rock Paper Scissors
//
//  Created by Vasiliy Shannikov on 16.12.2021.
//

import SwiftUI

struct Opponent_s_Pick: View {
   @State
    var showNextView: Bool = false
    var icon: String = compCoice()
    var data: GameData
    var body: some View {
        VStack{
            NavigationLink(isActive: $showNextView) {
                ResultView(data: data)
            } label: {
                EmptyView()
            }
            Text("Your opponent’s pick")
                .font(.system(size: 54, weight: .bold, design: .default))
                .multilineTextAlignment(.center)
               
            Spacer()
            PickButtonView( title: icon)
            Spacer()
        }
        .onAppear {
            DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                data.playerChoice2 = icon
                showNextView = true
            }
        }
        .padding()
        .navigationBarTitleDisplayMode(.inline)
        .navigationTitle("round #\(data.round)")

    }
}

struct Opponent_s_Pick_Previews: PreviewProvider {
    static var previews: some View {
        Opponent_s_Pick(data: GameData())
    }
}

func compCoice() -> String {
    let compChoice = Int.random(in: 1...3)
    var compChoiceStr :String
    switch compChoice {
    case 1 :compChoiceStr = "🗿"
    case 2: compChoiceStr = "✂"
    case 3: compChoiceStr = "📃"
    default: compChoiceStr = ""
    }
    
    return compChoiceStr
}
