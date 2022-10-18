//
//  ContentView.swift
//  WeSplit
//
//  Created by Tien Dao on 2022-10-17.
//

///ContentView.swift contains the initial user interface (UI) for your program, and is where we’ll be doing all the work in this project.

///Assets.xcassets is an asset catalog – a collection of pictures that you want to use in your app. You can also add colors here, along with app icons, iMessage stickers, and more.

////Preview Content is a group, with Preview Assets.xcassets inside – this is another asset catalog, this time specifically for example images you want to use when you’re designing your user interfaces, to give you an idea of how they might look when the program is running.

//SwiftUI framework
import SwiftUI

struct ContentView: View {
    @State private var checkAmount = 0.0
    @State private var numberOfPeople = 2
    @State private var tipPercentage = 20
    
    let tipPercentages = [10, 15, 20, 25, 0]

    
    var body: some View {
        NavigationView {
            Form {
                Section {
                    //                TextField("Amount", value: $checkAmount, format: .currency(code: Locale.current.currencyCode ?? "USD"))
                    /**For iOS 16: 'currencyCode' was deprecated in iOS 16: renamed to 'currency.identifier' **/
                    //                TextField("Amount", value: $checkAmount, format: .currency(code: Locale.current.currency?.identifier ?? "USD"))
                    //                    .keyboardType(.decimalPad)
                    ///Locale is a massive struct built into iOS that is responsible for storing all the user’s region settings – what calendar they use, how they separate thousands digits in numbers, whether they use the metric system, and more. In our case, we’re asking whether the user has a preferred currency code, and if they don’t we’ll fall back to “USD” so at least we have something.
                    
                    if #available(iOS 16, *) {
                        // Run code in iOS 15 or later.
                        TextField("Amount", value: $checkAmount, format: .currency(code: Locale.current.currency?.identifier ?? "USD"))
                            .keyboardType(.decimalPad)
                        //                        .keyboardType(.numberPad)
                        Picker("Number of people", selection: $numberOfPeople) {
                            ForEach(2..<100) {
                                Text("\($0) people")
                            }
                        }
                    } else {
                        // Fall back to earlier iOS APIs.
                        TextField("Amount", value: $checkAmount, format: .currency(code: Locale.current.currencyCode ?? "USD"))
                            .keyboardType(.decimalPad)
                        //                        .keyboardType(.numberPad)
                    }
                }
                
                if #available(iOS 16, *) {
                    // Run code in iOS 16 or later.
                    Section {
                        Text(checkAmount, format: .currency(code: Locale.current.currency?.identifier ?? "USD"))
                    }
                } else {
                    // Fall back to earlier iOS APIs.
                    Section {
                        Text(checkAmount, format: .currency(code: Locale.current.currencyCode ?? "USD"))
                    }
                }
                
            }
            .navigationTitle("WeSplit")
        }
        
    }
}


////This piece of code won’t actually form part of your final app that goes to the App Store, but is instead specifically for Xcode to use so it can show a preview of your UI design alongside your code.
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

//These previews use an Xcode feature called the canvas, which is usually visible directly to the right of your code. You can customize the preview code if you want, and they will only affect the way the canvas shows your layouts – it won’t change the actual app that gets run
