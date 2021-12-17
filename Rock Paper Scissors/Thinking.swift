//
//  Thinking.swift
//  Rock Paper Scissors
//
//  Created by Vasiliy Shannikov on 16.12.2021.
//

import SwiftUI

struct Thinking: View {
    @State var showNextView: Bool = false
    var data: GameData
    var body: some View {
        VStack{
            NavigationLink(isActive: $showNextView) {
                Opponent_s_Pick(data: data)
            } label: {
                EmptyView()
            }
            
            Text("Your opponent is thinking")
                .font(.system(size: 54, weight: .bold, design: .default))
                .multilineTextAlignment(.center)
                .lineLimit(3)
                

            Spacer()
            
            Button {
              //  showNextView = true
            } label: {
                ZStack{
                    RoundedRectangle(cornerRadius: 128)
                        .fill(Color( red: 0.95, green: 0.95, blue: 0.97, opacity: 1.0))
                        .frame( height: 128)
                    Image("loader_icon")
                }
            }
            .padding(.bottom,100)
            Spacer()
        }
        .onAppear {
            DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                showNextView = true
            }
        }
        .navigationBarTitleDisplayMode(.inline)
        .navigationTitle("round #\(data.round)")
        .padding()
    }
}

struct Thinking_Previews: PreviewProvider {
    static var previews: some View {
        Thinking(data: GameData())
    }
}
