//
//  WeatherList.swift
//  WeatherAppV3
//
//  
//

import SwiftUI

struct WeatherList: View {
    
    
    @Environment(\.presentationMode) var presentationMode
    @ObservedObject var weatherVM = WeatherViewModel()
    @AppStorage("isDarkMode") private var isDarkMode = false
    
    var body: some View {
        

            VStack {
                Text("Manage Cities")
                    .fontWeight(.bold)
                    .font(.system(size: 40))
                // .offset(x:0 , y:-350)
                //.foregroundColor(.black)


            }//VSTACK
    }
}

struct WeatherList_Previews: PreviewProvider {
    static var previews: some View {
        WeatherList()
    }
}

