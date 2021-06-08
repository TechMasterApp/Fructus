//
//  ContentView.swift
//  Fructus
//
//  Created by Gaurav Bhasin on 12/5/20.
//

import SwiftUI

struct ContentView: View {
    // MARK: - PROPERTIES
    
    @State private var showingSettings: Bool = false
    var fruits: [Fruit] = fruitsData
    
    // MARK: - BODY
    
    var body: some View {
        NavigationView {
            List {
                ForEach(fruits.shuffled()) { item in
                    NavigationLink(destination: FruitDetailView(fruit: item)) {
                        FruitRowView(fruit: item)
                    }
                }
            }.navigationTitle("Fruits")
            .navigationBarItems(trailing:
                Button(action: {
                    showingSettings.toggle()
                }) {
                    Image(systemName: "list.dash")
                }
            )
            .sheet(isPresented: $showingSettings) {
                SettingsView()
            }
        } //: NAVIGATION
        .navigationViewStyle(StackNavigationViewStyle())
    }
}

// MARK: - PREVIEW

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(fruits: fruitsData)
    }
}
