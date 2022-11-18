//
//  WeatherList.swift
//  WeatherAppV3
//
//  
//

import SwiftUI

struct WeatherList: View {
    
    func deleteCityName(at offsets: IndexSet) {
        offsets.forEach { index in
            let city = WeatherListVM.city[index]
            WeatherListVM.delete(city)
        }
        WeatherListVM.getAllCityName()
    }
    
    @StateObject private var WeatherListVM = WeatherListViewModel()
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
                HStack {
                    TextField("Enter City Name", text: $WeatherListVM.CityName)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                    Button("Save") {
                        WeatherListVM.save()
                        WeatherListVM.getAllCityName()
                    }
                }//HSTACK
                VStack{
                    SwiftUI.List {
                        ForEach (WeatherListVM.city, id: \.id) { city in
                            Text(city.CityName)
                        }
                        .onDelete(perform: deleteCityName)
                        .listRowBackground(Color.clear)
                    }
                    .listStyle(PlainListStyle())
                    Spacer()
                }
            }//VSTACK
    }
}

struct WeatherList_Previews: PreviewProvider {
    static var previews: some View {
        WeatherList()
    }
}

