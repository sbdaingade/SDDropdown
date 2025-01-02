//
//  SDDropDownView.swift
//  SDDropdown
//
//  Created by Sachin Daingade on 28/12/24.
//

import SwiftUI

struct SDDropDownView: View {
   
    @Binding var isPicking: Bool
    @Binding var selectedValue: String
    typealias Action = (String) -> Void
    var action: Action?
    var type: DropDownType = .carBrand
    
    init(isPicking: Binding<Bool>, selectedValue: Binding<String>, action: Action? = nil, type: DropDownType) {
        self._isPicking = isPicking
        self._selectedValue = selectedValue
        self.action = action
        self.type = type
    }
    
    var body: some View {
        VStack(spacing: 16) {
            Text("\(type.setDropdownTitle())")
                .padding(10)
            ScrollView {
                LazyVGrid(columns: [GridItem(.flexible())]) {
                    let list = type.getDropDownValues()
                    ForEach(0..<list.count, id: \.self) { index in
                        ZStack {
                            HStack {
                                VStack {
                                    Text("\(list[index])")
                                        .font(.title3)
                                }
                            } // HStack
                            
                            if list[index] == selectedValue {
                                HStack {
                                    Image(systemName: "checkmark")
                                        .padding(.leading, 40)
                                    Spacer()
                                }
                            }
                        } // ZStack
                        .frame(maxWidth: .infinity)
                        .onTapGesture {
                            debugPrint("\(list[index])")
                            action?(list[index])
                            isPicking = false
                            selectedValue = list[index]
                        }
                    }
                }
            }
        } // VStack
        .background(.gray)
        .frame(height: 344)
        .cornerRadius(33)
        .transition(.scale(0.8, anchor: .top).combined(with: .opacity).combined(with: .offset(y: -10)))
        .animation(.easeOut(duration: 0.14), value: isPicking)
        .zIndex(1)
    }
}

#Preview {
    SDDropDownView(isPicking: .constant(true), selectedValue: .constant("Mahindra"), type: .carBrand)
}
