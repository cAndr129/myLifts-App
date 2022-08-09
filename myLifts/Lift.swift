//
//  Lift.swift
//  myLifts
//
//  Created by Cory Andreasen on 8/1/22.
//

import Foundation

struct Lift: Identifiable, Codable{
    let id: UUID
    var name: String
    var goalWeight: Int
    var loggedLifts: [Double]
    var liftDates: [String]
    var theme: Theme
    
    init(id: UUID = UUID(), name: String, goalWeight: Int, loggedLifts: [Double], liftDates: [String], theme: Theme){
        self.id = id
        self.name = name
        self.goalWeight = goalWeight
        self.loggedLifts = loggedLifts
        self.liftDates = liftDates
        self.theme = theme
    }
}

extension Lift{
    struct Data{
        var name: String = ""
        var goalWeight: Int = 0
        var liftHistory: [Double] = [0]
        var liftDates: [String] = ["01/01/01"]
        var theme: Theme = .bubblegum
    }
    
    var data: Data{
        Data(name: name, goalWeight: goalWeight, liftHistory: loggedLifts, liftDates: liftDates, theme: theme)
    }
    
    init(data: Data){
        id = UUID()
        name = data.name
        goalWeight = data.goalWeight
        loggedLifts = data.liftHistory
        liftDates = data.liftDates
        theme = data.theme
    }
    
    mutating func update(from data: Data) {
        name = data.name
        name = data.name
        goalWeight = data.goalWeight
        loggedLifts = data.liftHistory
        liftDates = data.liftDates
        theme = data.theme
    }
    
}

extension Lift{
    static let sampleLifts: [Lift] =
    [
        Lift(name: "Bench", goalWeight: 225, loggedLifts: [105,115,125,140], liftDates: ["09/01/2021","10/31/2021","11/15/2021","12/25/2021"], theme: .bubblegum),
        Lift(name: "Deadlift", goalWeight: 315, loggedLifts: [135,200,240],liftDates: ["09/01/2021","10/31/2021","11/15/2021"], theme: .buttercup),
        Lift(name: "Squat", goalWeight: 225, loggedLifts: [100,135,160,175,190],liftDates: ["09/01/2021","10/31/2021","11/15/2021","12/25/2021","01/01/2022"],theme: .yellow)
    ]
}
