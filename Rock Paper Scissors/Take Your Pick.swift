//
//  Take Your Pick.swift
//  Rock Paper Scissors
//
//  Created by Vasiliy Shannikov on 16.12.2021.
//

import SwiftUI

struct Take_Your_Pick: View {
    @State
    var strChois: String = ""
    @State
    var next: Bool = false
    var data: GameData
    var body: some View {
        
        VStack(alignment: .center, spacing: 0){
            NavigationLink(isActive: $next) {
                Your_Pick( d: data)
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
                data.playerChoice1 = "📃"
                next = true
            } label: {
                PickButtonView( title: "📃")
            }
            
            Button {
                strChois = "✂"
                data.playerChoice1 = "✂"
                next = true
            } label: {
                PickButtonView( title: "✂")
            }
            
            Button {
                strChois = "🗿"
                data.playerChoice1 = "🗿"
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

struct Take_Your_Pick_Previews: PreviewProvider {
    
    static var previews: some View {
        Take_Your_Pick(data:GameData())
    }
}

struct PickButtonView: View {
    var buttonColor = Color( red: 0.95, green: 0.95, blue: 0.97, opacity: 1.0)
    var title = ""
    var body: some View {
        ZStack{
            RoundedRectangle(cornerRadius: 128)
                .fill(buttonColor)
                .border(.white)
                .frame( height: 128)
            Text(title)
                .foregroundColor(.white)
                .font(.system(size: 80
                             ))
        }
        .padding(.bottom,24)
    }
}

struct PaperBot: View {
    
    var body: some View {
        Button {
            print("hi")
        } label: {
            PickButtonView( title: "📃")
        }
    }
}
