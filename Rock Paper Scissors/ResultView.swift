//
//  ResultView.swift
//  Rock Paper Scissors
//
//  Created by Vasiliy Shannikov on 17.12.2021.
//

import SwiftUI

struct ResultView: View {
    var data: GameData
    @State var res = ""
    @State var isAnotherRound = false
    let gradStartWin = Color(red: 0.71, green: 0.93, blue: 0.61)
    let gradEndWin = Color(red: 0.14, green: 0.68, blue: 0.26)
    
    let gradStartLose = Color(red: 1.0, green: 0.41, blue: 0.38)
    let gradEndLose = Color(red: 0.99, green: 0.3, blue: 0.3)
    
    let gradStartTie = Color(red: 1.0, green: 0.41, blue: 0.38)
    let gradEndTie = Color(red: 1.0, green: 0.36, blue: 0.0)
    
    var body: some View {
        VStack(alignment: .center, spacing: 0){
            NavigationLink(isActive: $isAnotherRound) {
                Take_Your_Pick(data: data)
            } label: {
                EmptyView()
            }
//
//            NavigationLink(isActive: $goForvard) {
//                Thinking()
//            } label: {
//                EmptyView()
//            }

            if getWinner(data.playerChoice1, data.playerChoice2, data) == "win" {
                Text("Win")
                    .foregroundColor(gradEndWin)
                    .font(.system(size: 54, weight: .bold, design: .default))
                
            } else if getWinner(data.playerChoice1, data.playerChoice2, data) == "lose"{
                Text("Lose")
                    .foregroundColor(gradEndLose)
                    .font(.system(size: 54, weight: .bold, design: .default))
            } else
            {
                Text("Tie")
                    .foregroundColor(gradEndTie)
                    .font(.system(size: 54, weight: .bold, design: .default))
            }

            Text("Score \(data.playerScore1):\(data.playerScore2/2)")
                .foregroundColor(Color(red: 0.4, green: 0.310, blue: 0.64))
                .font(.system(size: 17, weight: .regular, design: .default))
            Spacer()
            
            ZStack{
                PickButtonView1( title: data.playerChoice1)
                    .frame(width: 320, height: 200, alignment: .topLeading)
                PickButtonView1( title: data.playerChoice2)
                    .frame(width: 320, height: 200, alignment: .bottomTrailing)
            }
              
                
           
            Spacer()
            
            Button {
                isAnotherRound = true
                data.round += 1
            } label: {
                ChoiceButtonView( title: "Another round")
            }
        }
        .padding()
        .navigationBarTitleDisplayMode(.inline)
        .navigationTitle("round #\(data.round)")
    }
}
//"🗿"  "✂" "📃"
func getWinner(_ pick1: String,_ pick2: String,_ data: GameData) -> String  {
    var res:String
    let stoneScissors = pick2 == "🗿" && pick1 == "✂"
    let scissorsPaper = pick2 == "✂" && pick1 == "📃"
    let paperStone = pick2 == "📃" && pick1 == "🗿"
    
    if pick1 == pick2  {
        res =  "tie"
      
    } else if stoneScissors || scissorsPaper || paperStone {
      res = "lose"
        data.playerScore2 += 1
    } else {
       res = "win"
        data.playerScore1 += 1
    }
   return res
}

struct PickButtonView1: View {
    var buttonColor = Color( red: 0.95, green: 0.95, blue: 0.97, opacity: 1.0)
    var title = ""
    var body: some View {
        ZStack{
            RoundedRectangle(cornerRadius: 128)
//
                .fill(buttonColor)
                .frame(width: 198, height: 128)
                .overlay(
                    RoundedRectangle(cornerRadius: 128)
                        .stroke(Color.white, lineWidth: 10)
                )
            Text(title)
              
                .foregroundColor(.white)
                .font(.system(size: 80
                             ))
        }
        //.background(buttonColor)
        //.padding(.bottom,24)
    }
}

struct ResultView_Previews: PreviewProvider {
    static var previews: some View {
        ResultView(data: GameData())
    }
}
