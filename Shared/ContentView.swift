//
//  ContentView.swift
//  Shared
//
//  Created by Jon Wadden on 2021-06-20.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack {
            
            
            ScrollView {
                VStack(alignment: .center, spacing: 0) {
                    Text("Banff")
                        .font(.system(.title))
                        .fontWeight(.medium)
                        .foregroundColor(Color.white)
                        .shadow(color: Color(#colorLiteral(red: 0, green: 0, blue: 0, alpha: 0.3)), radius: 4)
                      
                    Text("23°")
                        .font(.system(size: 76, weight: .thin))
                        .foregroundColor(Color.white)
                        .shadow(color: Color(#colorLiteral(red: 0, green: 0, blue: 0, alpha: 0.3)), radius: 4)
                    
                    Text("Partly Cloudy")
                        .font(.callout)
                        .fontWeight(.medium)
                        .foregroundColor(Color(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 0.75)))
                        .padding(.bottom, 2)
                        .shadow(color: Color(#colorLiteral(red: 0, green: 0, blue: 0, alpha: 0.3)), radius: 4)

                    HStack(spacing: 12) {
                        Text("H:26°")
                            .fontWeight(.medium)
                            
                        Text("L:7°")
                            .fontWeight(.medium)
                    }
                    .foregroundColor(.white)
                    .shadow(color: Color(#colorLiteral(red: 0, green: 0, blue: 0, alpha: 0.3)), radius: 4)
 
                }
                .padding(.top, 36)
                .padding(.bottom, 20)
                LongTermForecast()
            }
        }
        .background(
            Image("partlyCloudyBG")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .edgesIgnoringSafeArea(.all)
        )
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
