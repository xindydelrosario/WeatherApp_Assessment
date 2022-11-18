//
//  CurrentView.swift
//  WeatherAppV3
//
//  Created by xindy.del.rosario on 9/13/22.
//

import SwiftUI

//MARK: - CHANGE SHEETS
enum Sheets: Identifiable {
    
    var id: UUID {
        return UUID()
    }
    
    case AddCityView
    case Settings
}

struct ContentView: View {
    //MARK: - PROPERTIES
    @AppStorage("isDarkMode") private var isDarkMode = false
    @EnvironmentObject var store: Store
    @State private var activeSheet: Sheets?
    //MARK: - BODY
    var body: some View {
        NavigationView {
            ZStack{
                Image("Background")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .ignoresSafeArea(.all)
                ScrollView{
                    VStack{
                        
                        CurrentWeather()
                        
                        OtherInfo2()
                        
                        _daysforecast()
                        
                    }//:VSTACK
                }//:SCROLLVIEW
            }//:ZSTACK
            //MARK: - DARKMODE AND LIGHTMODE
            .preferredColorScheme(isDarkMode ? .dark : .light)
            
            
            //MARK: - CHANGE SHEETS
            .sheet(item: $activeSheet, content: { (item) in
                switch item {
                case .AddCityView:
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
