//
//  CurrentWeather.swift
//  WeatherAppV3
//
//  
//

import SwiftUI

struct CurrentWeather: View {
    //MARK: - PROPERTIES
    
    @ObservedObject var weatherVM = WeatherViewModel()
    @EnvironmentObject var store : Store
    
    //MARK: - BODY
    
    var body: some View {
        
        HStack {
            
            VStack {
                Text("\(weatherVM.dt)")
                
                Text("\(weatherVM.city)")
                    .font(.system(size: 40))
                    .fontWeight(.bold)
                HStack {
                    
                    Text("\(Int(weatherVM.getTemperatureByUnit(unit: store.selectedUnit))) ° \(String(store.selectedUnit.displayText.prefix(1)))")
                        .fontWeight(.bold)
                        .font(.system(size: 60))
                    
                    weatherVM.getIcon(main: weatherVM.main)
                        .font(.system(size: 80))
                }
                Text("\(weatherVM.main)")
                    .font(.system(size: 35))
                
                
            }//:VSTACK
            
        }//:HSTACK
        .foregroundColor(Color("TextColor"))
    }
}
//MARK: - PREVIEW
struct CurrentWeather_Previews: PreviewProvider {
    static var previews: some View {
        CurrentWeather()
            .previewLayout(.sizeThatFits)
            .padding()
    }
}

