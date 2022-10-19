//
//  ContentView.swift
//  ViewsAndModifiers
//
//  Created by Tien Dao on 2022-10-19.
//

import SwiftUI

///https://www.hackingwithswift.com/books/ios-swiftui/conditional-modifiers

struct ContentView: View {
    @State private var useRedText = false

    var body: some View {
        Button("Hello World") {
            // flip the Boolean between true and false
            useRedText.toggle()
        }
        .foregroundColor(useRedText ? .red : .blue)
    }
    /**Sometimes using if statements are unavoidable, but where possible prefer to use the ternary operator instead.
     */
//    var body: some View {
//        if useRedText {
//            Button("Hello World") {
//                useRedText.toggle()
//            }
//            .foregroundColor(.red)
//        } else {
//            Button("Hello World") {
//                useRedText.toggle()
//            }
//            .foregroundColor(.blue)
//        }
//    }

}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
