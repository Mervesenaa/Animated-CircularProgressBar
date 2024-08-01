//
//  ContentView.swift
//  CircularProgressView
//
//  Created by Merve Sena on 1.08.2024.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            CircularProgressBar()
                .frame(width: 200, height: 200)
        }
    }
}

#Preview {
    ContentView()
}
