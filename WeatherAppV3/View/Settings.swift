//
//  Settings.swift
//  WeatherAppV3
//
//  Created by xindy.del.rosario on 9/13/22.
//
import SwiftUI

enum TemperatureUnit: String, CaseIterable, Identifiable {
    
    var id: String {
        return rawValue
    }
    
    case celsius
    case fahrenheit
    case kelvin
}

extension TemperatureUnit {
    
    var displayText: String {
        switch self {
        case .celsius:
            return "Celsius"
        case .fahrenheit:
            return "Fahrenheit"
        case .kelvin:
            return "Kelvin"
        }
    }
    
}
struct Settings: View {
    
    //MARK: - PROPERTIES
    @AppStorage("unit") private var selectedUnit: TemperatureUnit = .celsius
    @EnvironmentObject var store: Store
    @Environment(\.presentationMode) var presentationMode
    @AppStorage("isDarkMode") private var isDarkMode = false
    
    //MARK: - BODY
    var body: some View{
        NavigationView{
            VStack {
                Text("Settings")
                    .fontWeight(.bold)
                    .font(.system(size: 40))
                    .offset(x:0 , y:50)
                    .foregroundColor(Color("TextColor"))
                
                //  TEMPERATURE
                Section(header: Text("Temperature")
                    .foregroundColor(Color("TextColor"))
                    .offset(x: -140, y: 0)){
                        Picker(selection: $selectedUnit, label: Text("Select temperature unit?")) {
                            ForEach(TemperatureUnit.allCases, id: \.self) {
                                Text("\($0.displayText)" as String)
                            }
                        }
                    }
                    .pickerStyle(SegmentedPickerStyle())
                    .offset(x:0 , y:65)
                    .foregroundColor(.black)
                
                // BACKGROUND
                Section(header: Text("Background")
                    .offset(x: -140, y: 0)
                    .foregroundColor(Color("TextColor"))) {
                        Picker("Mode", selection: $isDarkMode) {
                            Text("Light Mode")
                                .preferredColorScheme(.light)
                                .tag(false)
                            Text("Dark Mode")
                                .preferredColorScheme(.dark)
                                .tag(true)
                        }
                    }.offset(x: 0, y: 80)
                    .pickerStyle(SegmentedPickerStyle())
                Spacer()
            }//:VSTACK
            .navigationBarItems(leading: Button(action: {
                self.presentationMode.wrappedValue.dismiss()
                store.selectedUnit = selectedUnit
            }) {Image(systemName: "chevron.left")
                    .foregroundColor(Color("TextColor"))
            })
            
            .padding()
            .background(Image("Background")
                .resizable()
                .aspectRatio(contentMode: .fill))
            .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .center)
            .ignoresSafeArea(.all)
            .preferredColorScheme(isDarkMode ? .dark : .light)
        }//:NAVIGATIONVIEW
        .navigationBarHidden(true)
    }
}

//MARK: - PREVIEW
struct Settings_Previews: PreviewProvider {
    static var previews: some View {
        Settings()
            .environment(\.colorScheme, .dark)
    }
}
