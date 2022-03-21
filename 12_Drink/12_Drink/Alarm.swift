//
//  Alarm.swift
//  12_Drink
//
//  Created by Peter on 2022/03/21.
//

import Foundation

struct Alarm: Codable {
    var id: String = UUID().uuidString
    let date: Date
    var isOn: Bool
    
    
    var time: String {
        let timeFormatter = DateFormatter()
        timeFormatter.dateFormat = "hh:mm"
        return timeFormatter.string(from: date)
    }
    
    var meridiem: String {
        let meridiemFormatter = DateFormatter()
        meridiemFormatter.dateFormat = "a"
        meridiemFormatter.locale = Locale(identifier: "ko")
        return meridiemFormatter.string(from: date)
    }
}
