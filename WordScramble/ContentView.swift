//
//  ContentView.swift
//  WordScramble
//
//  Created by Tien Dao on 2022-10-21.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        //mix static and dynamic rows
        List {
            Text("Static row 1")
            Text("Static row 2")

            ForEach(0..<5) {
                Text("Dynamic row \($0)")
            }

            Text("Static row 3")
            Text("Static row 4")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
