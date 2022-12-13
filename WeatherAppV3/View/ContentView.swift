//
//  CurrentView.swift
//  WeatherAppV3
//
//  
//

import SwiftUI
import Combine
import CoreLocation

//MARK: - CHANGE SHEETS
enum Sheets: Identifiable {
    
    var id: UUID {
        return UUID()
    }
    
    case AddVityView
    case Settings
}

struct ContentView: View {
    
    //MARK: - PROPERTIES
    @AppStorage("isDarkMode") private var isDarkMode = false
    @EnvironmentObject var store: Store
    @State private var activeSheet: Sheets?
    @State var coordinates: (lat: Double, lon: Double) = (0,0)
    
    //MARK: - BODY
    var body: some View {
        NavigationView {
            ZStack{
                Image("Background")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .ignoresSafeArea(.all)
                ScrollView {
                    VStack{
                        
                        CurrentWeather()
                        
                        OtherInfo2()
                        
                        _daysforecast()
                        
                    }//:VSTACK

                }//:SCROLLVIEW
            }//:ZSTACK

            // DARKMODE AND LIGHTMODE
            .preferredColorScheme(isDarkMode ? .dark : .light)
            
            
            // CHANGE SHEETS
            .sheet(item: $activeSheet, content: { (item) in
                switch item {
                case .AddVityView:
                    AddCityView().environmentObject(store)
                case .Settings:
                    Settings().environmentObject(store)
                }
            })
            
            .navigationBarItems(leading:
                                    NavigationLink(destination: Settings(), label: {
                Image(systemName: "gearshape")
                    .foregroundColor(Color("TextColor"))
            })
                                , trailing:
                NavigationLink(destination: AddCityView(), label: {
                Image(systemName: "plus")
                    .foregroundColor(Color("TextColor"))
            }))
            
        }//:NAVIGATTIONVIEW
        .navigationBarHidden(true)
        
    }
}
//MARK: - PREVIEW

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environment(\.colorScheme, .dark)
            .environmentObject(Store())
    }
}
