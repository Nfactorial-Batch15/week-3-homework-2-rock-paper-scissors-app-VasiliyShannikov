//
//  Take Your Pick2.swift
//  Rock Paper Scissors
//
//  Created by Vasiliy Shannikov on 17.12.2021.
//

import SwiftUI

struct Take_Your_Pick2: View {
    @State
    var strChois: String = ""
    @State
    var next: Bool = false
    var data: GameData
    var body: some View {
        
        VStack(alignment: .center, spacing: 0){
            NavigationLink(isActive: $next) {
                ResultView( data: data)
            } label: {
                EmptyView()
            }

            Text("Take your pick")
                .font(.system(size: 54, weight: .bold, design: .default))
            Text("Score \(data.playerScore1):\(data.playerScore2/2)")
                .foregroundColor(Color(red: 0.4, green: 0.310, blue: 0.64))
                .font(.system(size: 17, weight: .regular, design: .default))
            Spacer()
            
            Button {
                strChois = "📃"
                data.playerChoice2 = "📃"
                next = true
            } label: {
                PickButtonView( title: "📃")
            }
            
            Button {
                strChois = "✂"
                data.playerChoice2 = "✂"
                next = true
            } label: {
                PickButtonView( title: "✂")
            }
            
            Button {
                strChois = "🗿"
                data.playerChoice2 = "🗿"
                next = true
            } label: {
                PickButtonView( title: "🗿")
            }
           
            
            Spacer()
        }
        .padding()
        .navigationBarTitleDisplayMode(.inline)
        .navigationTitle("round #\(data.round)")
    }
}

struct Take_Your_Pick2_Previews: PreviewProvider {
    
    static var previews: some View {
        Take_Your_Pick(data:GameData())
    }
}


