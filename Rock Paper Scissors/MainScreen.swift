//
//  MainScreen.swift
//  Rock Paper Scissors
//
//  Created by Vasiliy Shannikov on 16.12.2021.
//

import SwiftUI

struct MainScreen: View {
    @State
    var showTakeYourPick:Bool = false
    @State
    var multy_mode: Bool = false
    var data = GameData()
    var body: some View {
        NavigationView{
            ZStack{
                Image("BackgroundImage")
                    .edgesIgnoringSafeArea(.all)
                VStack {
                    NavigationLink(isActive: $showTakeYourPick) {
                        Take_Your_Pick( data:data)
                    } label: {
                        EmptyView()
                    }

                    Text("Wellcom to the game")
                        .bold()
                        .font(.system(size: 54))
                        .foregroundColor(.white)
                        .multilineTextAlignment(.center)
                        .padding(.top,170)
                    
                    Spacer()
                    
                    Button {
                        showTakeYourPick = true
                    } label: {
                        ChoiceButtonView( title: "Single player")
                    }
                    
                    Button {
                        showTakeYourPick = true
                        data.isMultyplayer = true
                        multy_mode = true
                    } label: {
                        ChoiceButtonView( title: "Multy player")
                    }
                    .padding(.bottom, 80)
                } // Vstack
                .padding(.horizontal,16)
            } // ZStack
        }  // navigation view

            
        }
    }

struct ChoiceButtonView: View {
    var buttonColor = Color( red: 0.4, green: 0.31, blue: 0.64, opacity: 1.0)
    var title = "Some title"
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 8)
                .fill(buttonColor)
                .frame( height: 50)
            Text(title)
                .foregroundColor(.white)
                .font(.system(size: 16
                             ))
        }
      
    }
}

struct MainScreen_Previews: PreviewProvider {
    static var previews: some View {
        MainScreen()
    }
}

class GameData {
    var isMultyplayer: Bool
    var playerChoice1: String
    var playerChoice2: String
    var playerScore1: Int
    var playerScore2: Int
    var round: Int
    
    init() {
        self.isMultyplayer = false
        self.playerChoice1 = ""
        self.playerChoice2 = ""
        self.playerScore1 = 0
        self.playerScore2 = 0
        self.round = 1
    }
}
