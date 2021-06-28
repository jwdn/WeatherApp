//
//  HourlyForecastSection.swift
//  weather
//
//  Created by Jon Wadden on 2021-06-20.
//

import SwiftUI

struct HourlyForecastSection: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            Text("Hourly Forecast")
                .font(.headline)
                .foregroundColor(.white)
            
            ScrollView(.horizontal) {
                HStack {
                    ForEach(0 ..< 11) { item in
                        VStack(spacing: 12) {
                            Text("\(item+1) AM")
                                .font(.system(size: 12))
                                .fontWeight(.regular)
                                .foregroundColor(.white)
                            Image(systemName: "cloud.fill")
                                .renderingMode(.original)
                            Text("23°")
                                .foregroundColor(.white)
                        }.padding(5)
                    }
                }
            }
            Spacer()
        }
        .padding(.leading, 6)
        .padding(.top, 8)
        .frame(width: 330, height: 150, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
    }
}

struct HourlyForecastSection_Previews: PreviewProvider {
    static var previews: some View {
        HourlyForecastSection()
            .previewLayout(.sizeThatFits)
            .background(Color(.systemBlue))
    }
}
