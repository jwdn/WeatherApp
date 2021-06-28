//
//  DailyForecastSection.swift
//  weather
//
//  Created by Jon Wadden on 2021-06-20.
//

import SwiftUI

struct DailyForecastSection: View {
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: /*@START_MENU_TOKEN@*/nil/*@END_MENU_TOKEN@*/){
                Text("Long-Term Forecast")
                    .font(.headline)
                    .foregroundColor(Color.white)
                VStack(alignment: .leading, spacing: /*@START_MENU_TOKEN@*/nil/*@END_MENU_TOKEN@*/){
                    ForEach(0 ..< 7) { i in
                        HStack {
                            Text("\(daysOfTheWeek[i])")
                            Spacer()
                            Image(systemName: "circle.fill")
                            Text("21°")
                            Text("14°")
                
                            
                        }
                    }
                }
                
            }
            .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, maxHeight: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, alignment: .leading)
            
        }
    }
}

struct DailyForecastSection_Previews: PreviewProvider {
    static var previews: some View {
        DailyForecastSection()
            .background(Color(.systemBlue))
    }
}


