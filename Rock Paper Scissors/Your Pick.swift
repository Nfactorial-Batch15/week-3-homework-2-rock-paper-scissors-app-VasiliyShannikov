//
//  Your Pick.swift
//  Rock Paper Scissors
//
//  Created by Vasiliy Shannikov on 16.12.2021.
//

import SwiftUI

struct Your_Pick: View {
    //var title: String
    @State var isBack: Bool = false
    @State var goForvard: Bool = false
    @State var goForvard2: Bool = false
    var d: GameData
    var body: some View {
        
        VStack(alignment: .center, spacing: 0){
            NavigationLink(isActive: $isBack) {
                Take_Your_Pick( data: d)
            } label: {
                EmptyView()
            }
            
            NavigationLink(isActive: $goForvard) {
                Thinking( data: d)
            } label: {
                EmptyView()
            }
            
            NavigationLink(isActive: $goForvard2) {
                ChangePlayer(d: d)
            } label: {
                EmptyView()
            }

            Text(" Your pick")
                .font(.system(size: 54, weight: .bold, design: .default))
            Text("Score \(d.playerScore1):\(d.playerScore2/2)")
                .foregroundColor(Color(red: 0.4, green: 0.310, blue: 0.64))
                .font(.system(size: 17, weight: .regular, design: .default))
            Spacer()
            
            Button {
                if !d.isMultyplayer {
                    goForvard = true
                } else {
                    goForvard2 = true
                }
            } label: {
                PickButtonView( title: d.playerChoice1)
            }
            Spacer()
            
            Button {
                isBack = true
            } label: {
                ChoiceButtonView( title: "I changed my mind")
            }
        }
        .padding()
        .navigationBarTitleDisplayMode(.inline)
        .navigationTitle("round #\(d.round)")
    }
}

struct Your_Pick_Previews: PreviewProvider {
    static var previews: some View {
        Your_Pick(d: GameData())
    }
}
