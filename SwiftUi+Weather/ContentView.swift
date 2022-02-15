//
//  ContentView.swift
//  SwiftUi+Weather
//
//  Created by Developer on 14/02/2022.
//

import SwiftUI

struct ContentView: View {
    @StateObject var locationManager = LocationManager()
    
    @State var isNight = false
    var body: some View {
        ZStack {
            BakcgroundView(isNight: $isNight)
            VStack {
                CityView(cityName: locationManager.country)
                VStack() {
                    WeatherMainDayView(imageName: isNight ? "cloud.moon.rain.fill" : "cloud.sun.fill", temperature: isNight ? 10:70)
                }
                .padding(.bottom,40)
                ScrollView(.horizontal) {
                    HStack(spacing:20) {
                        ForEach (arrayOfWeakDays) { dayOfweak in
                            WeatherDayView(dayOfWeak: dayOfweak.dayOfWeak, imageName: dayOfweak.imageName, temperature: dayOfweak.temperature)
                        }
                        .padding(10)
                    }
                    
                }
                Spacer()
                VStack {
                    Button {
                        isNight.toggle()
                    } label: {
                        WeatherButton(title: "Change day time")
                    }
                }
                Spacer()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct BakcgroundView:View {
    @Binding var isNight:Bool
    var body: some View {
        LinearGradient(gradient: Gradient(colors: [isNight ? .black: .blue,isNight ? .gray: Color("LightBlue")]), startPoint: .top, endPoint: .bottom)
            .edgesIgnoringSafeArea(.all)
    }
}

struct CityView: View {
    var cityName:String
    var body: some View {
        Text(cityName)
            .font(.system(size: 28, weight: .medium, design: .default))
            .foregroundColor(.white)
            .padding()
    }
}
struct WeatherMainDayView:View {
    var imageName:String
    var temperature:Int
    var body: some View {
        VStack(spacing:10 ) {
            Image(systemName: imageName)
                .renderingMode(.original)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 180, height: 180, alignment: .center)
            Text("\(temperature)°")
                .font(.system(size: 70, weight: .medium))
                .foregroundColor(.white)
        }
    }
}
struct WeatherDayView:View {
    
    var dayOfWeak:String
    var imageName:String
    var temperature:Int
    
    var body: some View {
        VStack() {
            Text(dayOfWeak)
                .font(.system(size: 16, weight: .medium))
                .foregroundColor(.white)
            Image(systemName: imageName)
                .renderingMode(.original)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 40, height: 40, alignment: .center)
            Text("\(temperature)°")
                .font(.system(size: 22, weight: .medium))
                .foregroundColor(.white)
        }
    }
}

struct WeatherButton:View {
    var title:String
    var body: some View {
        Text(title)
            .frame(width:280, height: 50)
            .background(.white)
            .font(.system(size: 20, weight: .bold, design: .default))
            .cornerRadius(30)
    }
}
