//
//  ContentView.swift
//  BetterRest
//
//  Created by Tien Dao on 2022-10-20.
//

import SwiftUI

struct ContentView: View {
    @State private var wakeUp = Date.now

    var body: some View {
//        DatePicker("Please enter a time", selection: $wakeUp, displayedComponents: .hourAndMinute)
//        DatePicker("Please enter a time", selection: $wakeUp, displayedComponents: .date)
//        DatePicker("Please enter a time", selection: $wakeUp, displayedComponents: .hourAndMinute)
        DatePicker("Please enter a time", selection: $wakeUp, in: Date.now...)
//            .labelsHidden()
    }
    
    func exampleDates() {
        // create a second Date instance set to one day in seconds from now
        let tomorrow = Date.now.addingTimeInterval(86400)

        // create a range from those two
        let range = Date.now...tomorrow
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
