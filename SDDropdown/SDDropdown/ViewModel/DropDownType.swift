//
//  DropDownType.swift
//  SDDropdown
//
//  Created by Sachin Daingade on 28/12/24.
//

enum DropDownType: CaseIterable {
    case carBrand
    case carType
    
    static let arrCarBrand:[String] = ["Nissan","Mahindra","Suzuki","Tata","Hyudai","Kia","Toyota","Raunolt","BMW"]
    static let arrCarType:[String] = ["Sedan","Micro SUV","SUV","MPV","Hybrid","EV","Compact Sedan"]
    
    
    func setDropdownTitle() -> String {
        switch self {
        case .carBrand:
            return "Car Brand"
        case .carType:
            return "Car Type"
        }
    }
    
    func getDropDownValues() -> [String] {
        switch self {
        case .carBrand:
            return DropDownType.arrCarBrand
        case .carType:
            return DropDownType.arrCarType
        }
    }
    
}
