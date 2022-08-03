//
//  Lift.swift
//  myLifts
//
//  Created by Cory Andreasen on 8/1/22.
//

import Foundation

struct Lift: Identifiable{
    let id: UUID
    var name: String
    var goalWeight: Int
    var liftHistory: [Int]
    var liftDates: [String]
    
    init(id: UUID = UUID(), name: String, goalWeight: Int, liftHistory: [Int], liftDates: [String]){
        self.id = id
        self.name = name
        self.goalWeight = goalWeight
        self.liftHistory = liftHistory
        self.liftDates = liftDates
    }
}

extension Lift{
    struct Data{
        var name: String = ""
        var goalWeight: Int = 200
        var liftHistory: [Int] = []
        var liftDates: [String] = []
    }
    
    var data: Data{
        Data(name: name, goalWeight: goalWeight, liftHistory: liftHistory, liftDates: liftDates)
    }
    
    init(data: Data){
        id = UUID()
        name = data.name
        goalWeight = data.goalWeight
        liftHistory = data.liftHistory
        liftDates = data.liftDates
    }
    
}

extension Lift{
    static let sampleLifts: [Lift] =
    [
        Lift(name: "Bench", goalWeight: 225, liftHistory: [105,115,125,140], liftDates: ["09/01/2021","10/31/2021","11/15/2021","12/25/2021"]),
        Lift(name: "Deadlift", goalWeight: 315, liftHistory: [135,200,240],liftDates: ["09/01/2021","10/31/2021","11/15/2021"]),
        Lift(name: "Squat", goalWeight: 225, liftHistory: [100,135,160,175,190],liftDates: ["09/01/2021","10/31/2021","11/15/2021","12/25/2021","01/01/2022"])
    ]
}
