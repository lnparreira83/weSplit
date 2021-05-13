//
//  ContentView.swift
//  WeSplit
//
//  Created by Lucas Parreira on 5/04/21.
//

import SwiftUI

struct ContentView: View {
    let tipPercentages = [10,15,20,25,0]
    
    @State private var checkAmount = ""
    @State private var numberOfPeople = 2
    @State private var tipPercentage = 1
    
    var totalPerPerson:Double {
        let peopleCount = Double(numberOfPeople + 2)
        let tipSelection = Double(tipPercentages[tipPercentage])
        let stringValue = "0.5"
        let doubleValue = Double(stringValue)
        let orderAmount = Double(checkAmount) ?? 0
        
        let tipValue = orderAmount / 100 * tipSelection
        let grandTotal = orderAmount + tipValue
        let amountPerPerson = grandTotal / peopleCount
        
        return amountPerPerson
    }
    
    var totalTip:Double {
        let peopleCount = Double(numberOfPeople + 2)
        let tipSelection = Double(tipPercentages[tipPercentage])
        let stringValue = "0.5"
        let doubleValue = Double(stringValue)
        let orderAmount = Double(checkAmount) ?? 0
        
        let tipValue = orderAmount / 100 * tipSelection
        let grandTotal = orderAmount + tipValue
        
        return grandTotal
    }
    
    var body: some View {
        
        NavigationView{
        Form {
            Section(header: Text("Amount")){
                TextField("Amount", text: $checkAmount).keyboardType(.decimalPad)
            }
            Section(header: Text("How much tip do you want to leave?")){
                Picker("Tip percentage", selection: $tipPercentage){
                    ForEach(0..<tipPercentages.count){
                        Text("\(self.tipPercentages[$0]) %")
                    }
                }.pickerStyle(SegmentedPickerStyle())
            }
            Section(header: Text("Amount plus Tip | whithout divison per person")){
                Text("\(totalTip, specifier:"%.2f")")
            }
            Section{
                Picker("Number of people", selection: $numberOfPeople){
                    ForEach(2..<100){
                        Text("\($0) people")
                    }
                }
                }
            Section{
                Text("Amount per person")
                Text("$\(totalPerPerson,specifier: "%.2f")")
            }
        }
        .navigationBarTitle(Text("WeSplit"),displayMode: .inline)
      }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
