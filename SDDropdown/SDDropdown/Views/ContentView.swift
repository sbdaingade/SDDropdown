//
//  ContentView.swift
//  SDDropdown
//
//  Created by Sachin Daingade on 25/12/24.
//

import SwiftUI

struct ContentView: View {
    @Binding var isPicking: Bool
    @Binding var selectedValue: String
    
    var body: some View {
        HStack {
            Button {
                isPicking.toggle()
            } label: {
                if selectedValue.isEmpty {
                    Text("Select Option")
                } else {
                    Text("\(selectedValue)")
                }
                
            }
            .frame(width: 200, height: 50)
            .background(Color.brown)
            .clipShape(.capsule(style: .circular))
            .padding()
        }.overlay(alignment: .topLeading) {
            if isPicking {
                SDDropDownView(isPicking: $isPicking, selectedValue: $selectedValue, type: .carBrand)
            }
        }.frame(maxWidth: .infinity)
        
    }
}

#Preview {
    ContentView(isPicking: .constant(true), selectedValue: .constant("Select"))
}
