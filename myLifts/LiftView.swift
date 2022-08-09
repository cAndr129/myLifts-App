//
//  liftView.swift
//  myLifts
//
//  Created by Cory Andreasen on 7/29/22.
//

import SwiftUI

struct LiftView: View {
    let lift: Lift
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Text(lift.name)
                    .accessibilityAddTraits(.isHeader)
                    .font(.system(size: 42))
                Spacer()
                VStack {
                    Label("Last lift", systemImage: "calendar")
                        .font(.caption)
                    Text("\(lift.liftDates[lift.liftDates.count-1])")
                }
            }
            Spacer()
            HStack{
                Text("Current Weight")
                    .font(.caption)
                Spacer()
                Text("Goal Weight")
                    .font(.caption)
            }
            HStack {
                Text("\((Int)(lift.loggedLifts[lift.loggedLifts.count-1])) lbs.")
                Spacer()
                Text("\(lift.goalWeight) lbs.")
            }
        }
        .foregroundColor(lift.theme.accentColor)
    }
}

struct LiftView_Previews: PreviewProvider {
    static var lift = Lift.sampleLifts[0]
    static var previews: some View {
        LiftView(lift: lift)
            .background(lift.theme.mainColor)
            .previewLayout(.fixed(width: 400, height: 100))
    }
}
