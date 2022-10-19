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
    @FocusState private var amountIsFocused: Bool
    
    let tipPercentages = [10, 15, 20, 25, 0]

    var totalPerPerson: Double {
        //calculate the total per person here
        let peopleCount = Double(numberOfPeople + 2)
        let tipSelection = Double(tipPercentage)

        let tipValue = checkAmount / 100 * tipSelection
        let grandTotal = checkAmount + tipValue
        let amountPerPerson = grandTotal / peopleCount

        return amountPerPerson
    }
    
    var grandTotalAndTip: Double {
        let tipSelection = Double(tipPercentage)

        let tipValue = checkAmount / 100 * tipSelection
        let grandTotal = checkAmount + tipValue
        
        return grandTotal
    }
    
    // Creating a new property with a special type. For this app, we want it to work with Doubles.
    var dollarFormat : FloatingPointFormatStyle<Double>.Currency {
        let currencyCode:String
        if #available(iOS 16, *) {
            // Run code in iOS 16 or later.
            currencyCode = Locale.current.currency?.identifier ?? "USD"

        } else {
            // Fall back to earlier iOS APIs.
            currencyCode = Locale.current.currencyCode ?? "USD"
        }
        
       return FloatingPointFormatStyle<Double>.Currency(
        code: currencyCode)
    }
    
    var body: some View {
        NavigationView {
            Form {
                Section {
                    //                TextField("Amount", value: $checkAmount, format: .currency(code: Locale.current.currencyCode ?? "USD"))
                    /**For iOS 16: 'currencyCode' was deprecated in iOS 16: renamed to 'currency.identifier' **/
                    //                TextField("Amount", value: $checkAmount, format: .currency(code: Locale.current.currency?.identifier ?? "USD"))
                    //                    .keyboardType(.decimalPad)
                    ///Locale is a massive struct built into iOS that is responsible for storing all the user’s region settings – what calendar they use, how they separate thousands digits in numbers, whether they use the metric system, and more. In our case, we’re asking whether the user has a preferred currency code, and if they don’t we’ll fall back to “USD” so at least we have something.
                    

                        TextField("Amount", value: $checkAmount, format: dollarFormat)
                            .keyboardType(.decimalPad)
                        //  .keyboardType(.numberPad)
                            .focused($amountIsFocused)
                        Picker("Number of people", selection: $numberOfPeople) {
                            ForEach(2..<100) {
                                Text("\($0) people")
                            }
                        }
                }
                
                Section {
                    
                    Picker("Tip percentage", selection: $tipPercentage) {
                        ForEach(0..<tipPercentages.count, id: \.self) {
                            Text(tipPercentages[$0], format: .percent)
                        }
                    }
                    .pickerStyle(.segmented)
                } header: {
                    Text("How much tip do you want to leave")
                } //That uses multiple trailing closures to specify both the section body (the first closure) and the second header (the second closure).
                
                
                    Section {
                        Text(grandTotalAndTip, format: dollarFormat)
                            .foregroundColor( tipPercentage == 4 ? .red : .black)
                    } header: {
                        Text("Amount Total with Tip")
//                            .foregroundColor(.red)
                        
                    }
//                    .foregroundColor( tipPercentage == 4 ? .red : .black)
                
                
                Section {
                    Text(totalPerPerson, format:dollarFormat)
                } header: {
                    Text("Amount per person")
                }
                
            }
            .navigationTitle("WeSplit")
            .toolbar {
                ToolbarItemGroup(placement: .keyboard) {
                    Spacer()
                    
                    Button("Done") {
                        amountIsFocused = false
                    }
                }
            }
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
