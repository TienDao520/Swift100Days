//
//  ContentView.swift
//  BetterRest
//
//  Created by Tien Dao on 2022-10-20.
//

import SwiftUI

struct ContentView: View {
    @State private var sleepAmount = 8.0

    var body: some View {
        ///we can just ask Swift to format the Double using formatted():
        Stepper("\(sleepAmount.formatted()) hours", value: $sleepAmount, in: 4...12, step: 0.25)


    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
