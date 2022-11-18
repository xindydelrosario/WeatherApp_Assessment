//
//  OtherInfoBackButton.swift
//  WeatherAppV3
//
//  Created by xindy.del.rosario on 9/19/22.
//

import SwiftUI

struct AddCityBackButton: View {
    var body: some View {
        HStack {
           
            Button(action: {}, label : {
                Image(systemName: "chevron.left")
                    .foregroundColor(.black)
                    .font(.title)
                Spacer()
                
            })
        }
    }
}

struct AddCityBackButton_Previews: PreviewProvider {
    static var previews: some View {
        AddCityBackButton()
            .previewLayout(.sizeThatFits)
            .padding()
            .background(.blue)
    }
}
