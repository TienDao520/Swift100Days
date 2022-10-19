//
//  ContentView.swift
//  ViewsAndModifiers
//
//  Created by Tien Dao on 2022-10-19.
//

import SwiftUI

///https://www.hackingwithswift.com/books/ios-swiftui/why-modifier-order-matters
///Whenever we apply a modifier to a SwiftUI view, we actually create a new view with that change applied – we don’t just modify the existing view in place. If you think about it, this behavior makes sense: our views only hold the exact properties we give them, so if we set the background color or font size there is no place to store that data.
struct ContentView: View {
    var body: some View {
        Button("Hello, world!") {
            print(type(of: self.body))
        }
        .frame(width: 200, height: 200)
        .background(.red)
//        .frame(width: 200, height: 200)
        Text("Hello, world!")
            .padding()
            .background(.red)
            .padding()
            .background(.blue)
            .padding()
            .background(.green)
            .padding()
            .background(.yellow)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
