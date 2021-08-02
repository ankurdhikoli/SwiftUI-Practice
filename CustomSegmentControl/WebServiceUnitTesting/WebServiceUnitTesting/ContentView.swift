//
//  ContentView.swift
//  WebServiceUnitTesting
//
//  Created by Ankur Chauhan on 8/1/21.
//
//https://medium.com/flawless-app-stories/the-complete-guide-to-network-unit-testing-in-swift-db8b3ee2c327
//https://masilotti.com/testing-nsurlsession-input/
//https://getswifty.dev/unit-testing-network-calls-in-swift-dependency-injection/
import SwiftUI

struct ContentView: View {
    var body: some View {

        Button(action: {
            let baseUrl = URL(string: "https://www.yoururl.com")!
            ApiService().getDataFromUrl(url: baseUrl)
        }) {
            Text("Hit Service!")
                .padding()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
