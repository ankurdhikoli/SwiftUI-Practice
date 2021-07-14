//
//  ContentView.swift
//  CustomSegmentControl
//
//  Created by Ankur Chauhan on 7/13/21.
//

import SwiftUI

struct ContentView: View {
    @State var selection: Int = 0
    private let items: [String] = ["Segment Control One", "Segment Control One", "Segment Control One"]

    var body: some View {
            SegmentedPicker(items: self.items, selection: self.$selection).padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

