//
//  AddCityView.swift
//  WeatherAppV3
//
//  
//

import SwiftUI

struct AddCityView: View {
    //MARK: - PROPERTIES
    func deleteCityName(at offsets: IndexSet) {
        offsets.forEach { index in
            let city = WeatherListVM.city[index]
            WeatherListVM.delete(city)
        }
        WeatherListVM.getAllCityName()
    }
    
    @State var City = Constants.Strings.location
    @Environment(\.presentationMode) var presentationMode
    @ObservedObject var weatherVM = WeatherViewModel()
    @AppStorage("isDarkMode") private var isDarkMode = false
    @StateObject private var WeatherListVM = WeatherListViewModel()
    
    //MARK: - BODY
    var body: some View {
        NavigationView{
            ZStack{
                VStack{
                    
                    Text("Manage Cities")
                        .fontWeight(.bold)
                        .font(.system(size: 40))
                        .offset(x:0 , y:80)
                        .foregroundColor(Color("TextColor"))
                    HStack{
                        TextField("Search", text: $City)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                            .foregroundColor(Color("TextColor"))
                            .padding()
                            .offset(x:0 , y:70)
                            .frame(width: 350, height: 50, alignment: .center)
                        Button("Save") {
                            Constants.Strings.location = City
                            //presentationMode.wrappedValue.dismiss()
                        }.offset(x:0 , y:70)
                            .foregroundColor(Color("TextColor"))
                            .padding()
                    }//HSTACK
//                    SwiftUI.List{
//                        ForEach (WeatherListVM.city, id: \.id) { city in
//                            Text(city.CityName)
//                        }
//                        .onDelete(perform: deleteCityName)
//                        .listRowBackground(Color.clear)
//                    }
//                    .listStyle(PlainListStyle())
// 
                    
                    Spacer()
                }//Vstack
            }//zstack
            .preferredColorScheme(isDarkMode ? .dark : .light)
            .background(Image("Background")
                .resizable()
                .aspectRatio(contentMode: .fill))
            .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .center)
            .ignoresSafeArea(.all)
            .navigationBarItems(leading: Button(action: {}, label: {
                            NavigationLink(destination: ContentView())
                            {
                                Image(systemName: "chevron.left")
                                    .foregroundColor(Color("TextColor"))
                            }
                        }))
       }//:navigationview
        .navigationBarHidden(true)
    }
    
}
//MARK: - PREVIEW

struct AddCityView_Previews: PreviewProvider {
    static var previews: some View {
        AddCityView()
            .environment(\.colorScheme, .dark)
    }
}
