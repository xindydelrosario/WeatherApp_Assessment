//
//  OtherInfo2.swift
//  WeatherAppV3
//
//  Created by xindy.del.rosario on 9/17/22.
//

import SwiftUI

struct OtherInfo2: View {
    
    //MARK: - PROPERTIES
    
    @ObservedObject var weatherVM = WeatherViewModel()
    @EnvironmentObject var store : Store
    
    //MARK: - BODY
    var body: some View {
        VStack(alignment: .center ){
            HStack(alignment: .bottom) {
                VStack (alignment: .leading) {
                    Image(systemName: "thermometer.sun.fill" )
                        .font(.system(size: 40))
                    Text("Max Temp")
                        .fontWeight(.bold)
                    Text("\(Int(weatherVM.getTemperatureByTempMax(unit: store.selectedUnit)))°\(String(store.selectedUnit.displayText.prefix(1)))")
                        .font(.system(size: 20))
                }//:VSTACK
             
                
                VStack {
                    Image(systemName: "thermometer.sun" )
                        .font(.system(size: 40))
                    Text("Min Temp")
                        .fontWeight(.bold)
                    Text("\(Int(weatherVM.getTemperatureByTempMin(unit: store.selectedUnit)))°\(String(store.selectedUnit.displayText.prefix(1)))")
                        .font(.system(size: 20))
                }//:VSTACK
              
                
                VStack {
                    Image(systemName: "humidity.fill" )
                        .font(.system(size: 40))
                    Text("Humidity")
                        .fontWeight(.bold)
                    Text("\(weatherVM.humidity.roundDouble()+"%")")
                        .font(.system(size: 20))
                }//:VSTACK
            
                
            }//:HSTACK
            
            HStack(alignment: .bottom) {
                VStack(alignment: .leading) {
                    Image(systemName: "thermometer.snowflake")
                        .font(.system(size: 40))
                    Text("Feels Like")
                        .fontWeight(.bold)
                    Text("\(Int(weatherVM.getTemperatureByFeelsLike(unit: store.selectedUnit)))°\(String(store.selectedUnit.displayText.prefix(1)))")
                        .font(.system(size: 20))
                }//:VSTACK
   
                
                VStack {
                    Image(systemName: "barometer")
                        .font(.system(size: 40))
                    Text("Pressure")
                        .fontWeight(.bold)
                    Text("\(weatherVM.pressure.roundDouble()+"hPa")")
                }//:VSTACK
                .offset(x:0 , y:-4)
                
                VStack {
                    Image(systemName: "wind")
                        .font(.system(size: 40))
                    Text("Wind Speed")
                        .fontWeight(.bold)
                    Text("\(weatherVM.speed.roundDouble()+"m/s")")
                        .font(.system(size: 20))
                }//:VSTACK
              
            }//:HSTACK
    }

        .foregroundColor(Color("TextColor"))
        .frame(maxWidth: 345,  maxHeight: 450)
        .background(Color("ColorBackground"))
        .cornerRadius(20)
        
    }
}

//MARK: - PREVIEW
struct OtherInfo2_Previews: PreviewProvider {
    static var previews: some View {
        OtherInfo2()
            .previewLayout(.sizeThatFits)
            .padding()
        
    }
}
