//
//  SampleWeatherData.swift
//  weather
//
//  Created by Jon Wadden on 2021-06-25.
//

import Foundation

struct dailyWeatherData {
    let id = UUID()
    var dayOfWeek: String
    var minTemp: Double
    var maxTemp: Double
    var condition: String
    
    // following variables optional ONLY FOR TESTING
    var pop: Int?
    var precipitation: Double?
    var sunrise: Int?
    var sunset: Int?
}

struct currentCondition {
    var currentTemp: Double
    var feelsLike: Double
    var condition: String
    var conditionDesc: String
    var humidity: Double
    var dewPoint: Double
    var aqi: Int
    var uvIndex: Int
    var airPressure: Int
    var visibility: Double
    var precipitation: Double
    var wind: wind
}

struct wind {
    var direction: Double
    var speed: Double
}


let demoCurrentCondition = currentCondition(
    currentTemp: 23.0,
    feelsLike: 23.0,
    condition: "Partly Cloudy",
    conditionDesc: "Partly cloudy conditions will continue for the rest of the day",
    humidity: 35.0,
    dewPoint: 7.0,
    aqi: 1,
    uvIndex: 6,
    airPressure: 1015,
    visibility: 16.1,
    precipitation: 0,
    wind: wind(direction: 45.0, speed: 12.9)
)

let demo10DayForecast = [
    dailyWeatherData(dayOfWeek: "Today", minTemp: 7.0, maxTemp: 26.0, condition: "Partly Cloudy", pop: 0),
    dailyWeatherData(dayOfWeek: "Sat", minTemp: 12, maxTemp: 30, condition: "Sunny", pop: 0),
    dailyWeatherData(dayOfWeek: "Sun", minTemp: 13, maxTemp: 32, condition: "Sunny", pop: 0),
    dailyWeatherData(dayOfWeek: "Mon", minTemp: 14, maxTemp: 36, condition: "Sunny", pop: 0),
    dailyWeatherData(dayOfWeek: "Tue", minTemp: 17, maxTemp: 36, condition: "Sunny", pop: 0),
    dailyWeatherData(dayOfWeek: "Wed", minTemp: 17, maxTemp: 37, condition: "Sunny", pop: 0),
    dailyWeatherData(dayOfWeek: "Thurs", minTemp: 17, maxTemp: 34, condition: "Sunny", pop: 0),
    dailyWeatherData(dayOfWeek: "Fri", minTemp: 16, maxTemp: 33, condition: "Thunderstorm", pop: 40),
    dailyWeatherData(dayOfWeek: "Sat", minTemp: 16, maxTemp: 31, condition: "Thunderstorm", pop: 40),
    dailyWeatherData(dayOfWeek: "Sun", minTemp: 15, maxTemp: 29, condition: "Thunderstorm", pop: 50)
]
