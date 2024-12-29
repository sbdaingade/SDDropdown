//
//  SDDropdownApp.swift
//  SDDropdown
//
//  Created by Sachin Daingade on 25/12/24.
//

import SwiftUI

@main
struct SDDropdownApp: App {
    @State var isPicking: Bool = false
    @State var selectedValue: String = ""

    var body: some Scene {
        WindowGroup {
            ContentView(isPicking: $isPicking, selectedValue: $selectedValue)
        }
    }
}
