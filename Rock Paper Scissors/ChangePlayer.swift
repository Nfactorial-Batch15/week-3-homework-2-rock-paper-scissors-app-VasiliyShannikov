//
//  ChangePlayer.swift
//  Rock Paper Scissors
//
//  Created by Vasiliy Shannikov on 17.12.2021.
//

import SwiftUI

struct ChangePlayer: View {
    var d: GameData
    @State var goForvard: Bool = false
    var body: some View {
        VStack(alignment: .center, spacing: 0){
//            NavigationLink(isActive: $isBack) {
//                Take_Your_Pick( data: d)
//            } label: {
//                EmptyView()
//            }
            
            NavigationLink(isActive: $goForvard) {
                Take_Your_Pick2( data: d)
            } label: {
                EmptyView()
            }

            Text("Pass the phone to your opponent")
                .font(.system(size: 54, weight: .bold, design: .default)).self
                .multilineTextAlignment(.center)
//            Text("Score \(d.playerScore1):\(d.playerScore2/2)")
//                .foregroundColor(Color(red: 0.4, green: 0.310, blue: 0.64))
//                .font(.system(size: 17, weight: .regular, design: .default))
            Spacer()
            
//            Button {
//               goForvard = true
//            } label: {
//                PickButtonView( title: d.playerChoice1)
//            }
//            Spacer()
            
            Button {
                goForvard = true
            } label: {
                ChoiceButtonView( title: "Ready to continue")
            }
        }
        .padding()
        .navigationBarTitleDisplayMode(.inline)
        .navigationTitle("round #\(d.round)")
    }
}

struct ChangePlayer_Previews: PreviewProvider {
    static var previews: some View {
        ChangePlayer(d: GameData())
    }
}
