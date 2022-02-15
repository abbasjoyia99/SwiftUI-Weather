//
//  DayOfWeak.swift
//  SwiftUi+Weather
//
//  Created by Developer on 15/02/2022.
//

import Foundation

struct DayOfWeak:Identifiable {
    var id: String
    let dayOfWeak:String
    let temperature:Int
    let imageName:String
}

var arrayOfWeakDays = [DayOfWeak(id: "0", dayOfWeak: "Mon", temperature: 40, imageName: "sun.max.fill"),DayOfWeak(id: "1", dayOfWeak: "Tue", temperature: 30, imageName: "sun.and.horizon"),DayOfWeak(id: "2", dayOfWeak: "Wen", temperature: 6, imageName: "snowflake"),DayOfWeak(id: "3", dayOfWeak: "Thu", temperature: 22, imageName: "cloud.sun.rain"),DayOfWeak(id: "4", dayOfWeak: "Fri", temperature: 0, imageName: "wind.snow"),DayOfWeak(id: "5", dayOfWeak: "Sat", temperature: 76, imageName: "cloud.sun.fill"),DayOfWeak(id: "6", dayOfWeak: "Sun", temperature: 73, imageName: "cloud.sun")]
