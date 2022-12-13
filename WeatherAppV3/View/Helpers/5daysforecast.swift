//
//  5daysforecast.swift
//  WeatherAppV3
//
//  
//

import SwiftUI

struct _daysforecast: View {
    
    @ObservedObject var weatherVM = WeatherViewModel()
    @EnvironmentObject var store : Store
    
    var body: some View {
        
        ZStack {
            VStack {
                HStack{
                    Text("\(weatherVM.Daysdt[0])")
                        .fontWeight(.bold)
                        .padding()
                        .font(.system(size: 18))
                    Spacer()
                    
                    Text("\(weatherVM.DaysWeather[0]!)")
                        .fontWeight(.bold)
                        .padding()
                        .font(.system(size: 18))
                    Spacer()
                    
                    Text("\(Int((weatherVM.getTemperatureByDays(unit: store.selectedUnit))[0]))°\(String(store.selectedUnit.displayText.prefix(1)))")
                        .fontWeight(.bold)
                        .padding()
                        .font(.system(size: 18))
                }//:HSTACK
                
                
                HStack{
                    Text("\(weatherVM.Daysdt[1])")
                        .fontWeight(.bold)
                        .padding()
                        .font(.system(size: 18))
                    Spacer()
                    
                    Text("\(weatherVM.DaysWeather[1]!)")
                        .fontWeight(.bold)
                        .font(.system(size: 18))
                        .padding()
    
                    Spacer()
                    
                    Text("\(Int((weatherVM.getTemperatureByDays(unit: store.selectedUnit))[1]))°\(String(store.selectedUnit.displayText.prefix(1)))")
                        .fontWeight(.bold)
                        .padding()
                        .font(.system(size: 18))
                }//:HSTACK
                
                
                HStack{
                    Text("\(weatherVM.Daysdt[2])")
                        .fontWeight(.bold)
                        .padding()
                        .font(.system(size: 18))
                    Spacer()
                    
                    Text("\(weatherVM.DaysWeather[2]!)")
                        .fontWeight(.bold)
                        .padding()
                        .font(.system(size: 18))
                    Spacer()
                    
                    Text("\(Int((weatherVM.getTemperatureByDays(unit: store.selectedUnit))[2]))°\(String(store.selectedUnit.displayText.prefix(1)))")
                        .fontWeight(.bold)
                        .padding()
                        .font(.system(size: 18))
                }//:HSTACK
                
                
                HStack{
                    Text("\(weatherVM.Daysdt[3])")
                        .fontWeight(.bold)
                        .padding()
                        .font(.system(size: 18))
                    Spacer()
                    
                    Text("\(weatherVM.DaysWeather[3]!)")
                        .fontWeight(.bold)
                        .padding()
                        .font(.system(size: 18))
                    Spacer()
                    
                    Text("\(Int((weatherVM.getTemperatureByDays(unit: store.selectedUnit))[3]))°\(String(store.selectedUnit.displayText.prefix(1)))")
                        .fontWeight(.bold)
                        .padding()
                        .font(.system(size: 18))
                }//:HSTACK
                
                
                HStack{
                    Text("\(weatherVM.Daysdt[4])")
                        .fontWeight(.bold)
                        .padding()
                        .font(.system(size: 18))
                    Spacer()
                    
                    Text("\(weatherVM.DaysWeather[4]!)")
                        .fontWeight(.bold)
                        .padding()
                        .font(.system(size: 18))
                    Spacer()
                    
                    Text("\(Int((weatherVM.getTemperatureByDays(unit: store.selectedUnit))[4]))°\(String(store.selectedUnit.displayText.prefix(1)))")
                        .fontWeight(.bold)
                        .padding()
                        .font(.system(size: 18))
                }//:HSTACK
            }//:VTSACK
        }//:ZTACK
        .foregroundColor(Color("TextColor"))
        .background(Color("ColorBackground"))
        .frame(maxWidth: 350,  maxHeight: 350)
        .cornerRadius(30)
        //.padding()
    }
}

struct _daysforecast_Previews: PreviewProvider {
    static var previews: some View {
        _daysforecast()
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
