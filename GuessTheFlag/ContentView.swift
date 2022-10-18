//
//  ContentView.swift
//  GuessTheFlag
//
//  Created by Tien Dao on 2022-10-18.
//

import SwiftUI

struct ContentView: View {

    /**Stacks**/
//    var body: some View {
//
////        VStack {
////            Spacer()
////            Text("First")
////            Text("Second")
////            Text("Third")
////            Spacer()
////            Spacer()
////        }
//
//        VStack(alignment: .leading, spacing: 20) {
//            HStack(spacing: 20) {
//                Text("1")
//                Text("2")
//                Text("3")
//            }
//            HStack(spacing: 20) {
//                Text("4")
//                Text("5")
//                Text("6")
//            }
//            HStack(spacing: 20) {
//                Text("7")
//                Text("8")
//                Text("9")
//            }
//        }
//    }
    
        /**Color**/
//        var body: some View {
////            ZStack {
////                Text("Your content")
////            }
////            .background(.red)
//
//
////            ZStack {
////                Text("Your content")
////                    .background(.red)
////            }
//
//
////            ZStack {
////                Color.red
////                    .frame(minWidth: 200, maxWidth: .infinity, maxHeight: 200)
////                Text("Your content")
////            }
//
////            ZStack {
////                Color(red: 1, green: 0.8, blue: 0)
////                Text("Your content")
////            }
////            .ignoresSafeArea()
//
//
//
//            ///For example, Color.primary is the default color of text in SwiftUI, and will be either black or white depending on whether the user’s device is running in light mode or dark mode. There’s also Color.secondary, which is also black or white depending on the device, but now has slight transparency so that a little of the color behind it shines through.
//
//
//            ///cmd + shift + A to swap dark/light mode
//            ZStack {
//                VStack(spacing: 0) {
//                    Color.red
//                    Color.blue
//                }
//
//                Text("Your content")
////                    .foregroundColor(.secondary)
//                    .foregroundStyle(.secondary)
//                    .padding(50)
//                    .background(.ultraThinMaterial)
//            }
//            .ignoresSafeArea()
//        }
    
    /**Gradient**/
    var body: some View {
        /**LinearGradient*/
        //        LinearGradient(gradient: Gradient(colors: [.white, .black]), startPoint: .top, endPoint: .bottom)
        
        ///Gradient should be white from the start up to 45% of the available space, then black from 55% of the available space onwards:
        //        LinearGradient(gradient: Gradient(stops: [
        //                Gradient.Stop(color: .white, location: 0.45),
        //                Gradient.Stop(color: .black, location: 0.55),
        //            ]), startPoint: .top, endPoint: .bottom)
        
        /// we can just write .init rather than Gradient.Stop, like this:
//        LinearGradient(gradient: Gradient(stops: [
//            .init(color: .white, location: 0.45),
//            .init(color: .black, location: 0.55),
//        ]), startPoint: .top, endPoint: .bottom)
        
        /**RadialGradient**/
//        RadialGradient(gradient: Gradient(colors: [.blue, .black]), center: .center, startRadius: 20, endRadius: 200)
        
        /**AngularGradient**/
        AngularGradient(gradient: Gradient(colors: [.red, .yellow, .green, .blue, .purple, .red]), center: .center)


    }
    
    
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
