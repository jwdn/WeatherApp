//
//  LongTermForecast.swift
//  weather
//
//  Created by Jon Wadden on 2021-06-25.
//

import SwiftUI
import CoreGraphics

let _DEBUG: Bool = false

let daysOfTheWeek = [
    "Sunday", "Monday", "Tuesday", "Wednesday",
    "Thursday", "Friday", "Saturday"
]

struct LongTermForecast: View {
    var body: some View {
        
        VStack(alignment: .leading) {
            HStack (alignment: .center, spacing: 4) {
                Image(systemName: "calendar")
                Text("10-DAY FORECAST")
                    .fontWeight(.medium)
            }
            .font(.footnote)
            .foregroundColor(Color(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 0.7)))
            .padding(.top)
            .padding(.leading)
            
            VStack {
                ForEach(demo10DayForecast, id: \.id) { item in
                    Divider().background(Color(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 0.6)))
                    
                    HStack(alignment: .center, spacing: nil){
                        Text(item.dayOfWeek)
                            .foregroundColor(.white)
                            .font(.system(size: 18, weight: .semibold))
                            .shadow(color: Color(#colorLiteral(red: 0, green: 0, blue: 0, alpha: 0.15)), radius: 2, x: 0.0, y: 0.0)
                        
                        Spacer()
                        
                        // Condition Icon & POP%
                        VStack(alignment: .center) {
                            Image(systemName: conditionImagesDay[item.condition]!)
                                .renderingMode(.original)
                            
                            if item.pop != 0 {
                                Text("\(item.pop!)%")
                                    .font(.system(size: 12, weight: .semibold))
                                    .foregroundColor(Color(#colorLiteral(red: 0.4745098054, green: 0.8392156959, blue: 0.9764705896, alpha: 1)))
                            }
                            
                        }
                        .frame(width: 40)
                        
                        HStack{
                            Text("\(Int(item.minTemp))°")
                                .foregroundColor(Color(#colorLiteral(red: 0.4745098054, green: 0.8392156959, blue: 0.9764705896, alpha: 1)))
                                .fontWeight(.medium)
                                .frame(width: 36, alignment: .center)
                                .shadow(color: Color(#colorLiteral(red: 0, green: 0, blue: 0, alpha: 0.15)), radius: 2, x: 0.0, y: 0.0)

                            TempRange(
                                today: item.dayOfWeek == "Today",
                                minTempToday: item.minTemp,
                                maxTempToday: item.maxTemp
                            )
                            
                            Text("\(Int(item.maxTemp))°")
                                .foregroundColor(.white)
                                .fontWeight(.medium)
                                .frame(width: 36, alignment: .center)
                                .shadow(color: Color(#colorLiteral(red: 0, green: 0, blue: 0, alpha: 0.15)), radius: 2, x: 0.0, y: 0.0)
                        }
                    }
                    .frame(height: 26)
                }
            }
            .padding(.leading)
            .padding(.trailing)
            .padding(.bottom)
        }
        .background(
            VisualEffectBlur(blurStyle:.systemUltraThinMaterialDark)
                        .edgesIgnoringSafeArea(.all)
        )
        .clipShape(RoundedRectangle(cornerRadius: 12, style: .continuous))
        .padding()
    }
    
}





struct TempRange: View {
    var today: Bool = false;
    
    let currentTempCircleSize: CGFloat = 6
    
    let lineHeight: CGFloat = 4.0
    let lineWidth: CGFloat = 80.0
    
    var minTempToday: Double = 7
    var maxTempToday: Double = 26
    var currentTemp: Double = 23
    
    var minTempGlobal: Double = globalMinMaxTemp()["min"]!
    var maxTempGlobal: Double = globalMinMaxTemp()["max"]!
    
    let _tempLineWidth: CGFloat = 40.0
    
    func tempLine() -> [String: CGFloat] {
        var scale: CGFloat = 0
        var start: CGFloat = 0
        var end: CGFloat = 0
        var current: CGFloat = 0
        
        scale = CGFloat(lineWidth) / CGFloat(maxTempGlobal-minTempGlobal)
        start = scale * CGFloat(minTempToday - minTempGlobal)
        end = lineWidth - (scale * CGFloat(maxTempGlobal - maxTempToday))
        current = lineWidth - (scale * CGFloat(maxTempGlobal - currentTemp))
        
        return [
            "scale": scale,
            "start": start,
            "end": end,
            "current": current,
        ]
    }
    
    let gradientColors = [
        Color(#colorLiteral(red: 0.4745098054, green: 0.8392156959, blue: 0.9764705896, alpha: 1)),
        Color(#colorLiteral(red: 0.4666666687, green: 0.7647058964, blue: 0.2666666806, alpha: 1)),
        Color(#colorLiteral(red: 0.9607843161, green: 0.7058823705, blue: 0.200000003, alpha: 1)),
        Color(#colorLiteral(red: 0.9372549057, green: 0.3490196168, blue: 0.1921568662, alpha: 1))
    ]
    
    var body: some View {
        ZStack (alignment: .leading) {

            // Temperature Scale Background
            RoundedRectangle(cornerRadius: 10)
                .fill(Color(#colorLiteral(red: 0, green: 0, blue: 0, alpha: 0.2)))
                .frame(
                    width: lineWidth,
                    height: lineHeight,
                    alignment: .center
                )
            
            
            let gLineStart = tempLine()["start"]!
            let gLineEnd = tempLine()["end"]!
            let gLineWidth = gLineEnd - gLineStart
            
            // Temperature Gradient Line
            RoundedRectangle(cornerRadius: 10)
                .fill(LinearGradient(
                        gradient: Gradient(colors: gradientColors),
                        startPoint: .leading,
                        endPoint: .trailing
                    )
                )
                .frame(
                    maxWidth: lineWidth,
                    maxHeight: lineHeight
                )
                .mask(
                    ZStack(alignment: .leading) {
                        RoundedRectangle(cornerRadius: 10).frame(width: gLineWidth)
                    }
                    .frame(
                        width: lineWidth,
                        height: lineHeight,
                        alignment: .leading
                    )
                    .offset(x: gLineStart)
                )
                
            // Display circle over current temperature on today's section
            if today {
                Circle()
                    .stroke(Color.white, lineWidth: 2)
                    .frame(width: currentTempCircleSize, alignment: .center)
                    .shadow(radius: 2)
                    .offset(x: (tempLine()["current"]! - (currentTempCircleSize / 2)))
            }
            
        }
    }
}

struct LongTermForecast_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            LongTermForecast()
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(
            Image("partlyCloudyBG")
                .resizable()
                .aspectRatio(contentMode: /*@START_MENU_TOKEN@*/.fill/*@END_MENU_TOKEN@*/)
                .edgesIgnoringSafeArea(.all)
        )
    }
}

var conditionImagesDay = [
    "Sunny": "sun.max.fill",
    "Partly Cloudy": "cloud.sun.fill",
    "Overcast": "cloud.fog.fill",
    
    "Thunderstorm": "cloud.bolt.fill",
    "Scattered Thunderstorms": "cloud.sun.bolt.fill",
    "Chance of Thunderstorms": "cloud.sun.bolt.fill",
    
    "Drizzle": "cloud.drizzle.fill",
    "Showers": "cloud.rain.fill",
    "Scattered Showers": "cloud.sun.rain.fill",
    "Heavy Rain": "cloud.heavyrain.fill",
    
    "Hail": "cloud.hail.fill",
    "Sleet": "cloud.sleet.fill",
    "Snow": "cloud.snow.fill",
    "Fog": "cloud.fog.fill",
    
    "Tornado": "tornado",
    "Hurricane": "hurricane",
    "Tropical Storm": "tropicalstorm",
    "Smog": "smoke.fill",
]

var conditionImagesNight = [
    "Clear": "moon.stars.fill",
    "Partly Cloudy": "cloud.moon.fill",
    "Overcast": "cloud.fog.fill",
    
    "Thunderstorm": "cloud.bolt.fill",
    "Scattered Thunderstorms": "cloud.moon.bolt.fill",
    "Chance of Thunderstorms": "cloud.moon.bolt.fill",
    
    "Drizzle": "cloud.drizzle.fill",
    "Showers": "cloud.rain.fill",
    "Scattered Showers": "cloud.moon.rain.fill",
    "Heavy Rain": "cloud.heavyrain.fill",
    
    "Hail": "cloud.hail.fill",
    "Sleet": "cloud.sleet.fill",
    "Snow": "cloud.snow.fill",
    "Fog": "cloud.fog.fill",
    
    "Tornado": "tornado",
    "Hurricane": "hurricane",
    "Tropical Storm": "tropicalstorm",
    "Smog": "smoke.fill",
]

func globalMinMaxTemp() -> [String: Double] {
    var min:Double = .infinity
    var max:Double = -(.infinity)
    
    for day in demo10DayForecast {
        min = day.minTemp <= min ? day.minTemp : min
        max = day.maxTemp >= max ? day.maxTemp : max
    }
    
    return ["min": min, "max": max]
}
