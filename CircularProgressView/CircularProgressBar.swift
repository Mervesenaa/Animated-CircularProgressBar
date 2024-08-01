//
//  CircularProgressBar.swift
//  CircularProgressView
//
//  Created by Merve Sena on 1.08.2024.
//

import SwiftUI

struct CircularProgressBar: View {
    @State private var progress: CGFloat = 0.0 // Progress value between 0 and 1
    var lineWidth: CGFloat = 20
    var gradientColors: [Color] = [Color.red, Color.orange]
    
    var body: some View {
        ZStack {
            Circle()
                .stroke(lineWidth: lineWidth)
                .opacity(0.3)
                .foregroundColor(Color.gray)
            
            Circle()
                .trim(from: 0.0, to: progress)
                .stroke(
                    AngularGradient(gradient: Gradient(colors: gradientColors),
                                    center: .center,
                                    startAngle: .degrees(0),
                                    endAngle: .degrees(360 * Double(progress))),
                    style: StrokeStyle(lineWidth: lineWidth, lineCap: .round, lineJoin: .round)
                )
                .rotationEffect(Angle(degrees: 270.0))
                .shadow(color: gradientColors.last!.opacity(0.7), radius: 10, x: 0, y: 0)
                .animation(.linear(duration: 1.0), value: progress) // Added animation
                
            Text(String(format: "%.0f %%", min(progress, 1.0) * 100.0))
                .font(.largeTitle)
                .bold()
        }
        .padding(20)
        .onAppear {
            withAnimation {
                self.progress = 0.65 // Example progress value
            }
        }
    }
}

#Preview {
    CircularProgressBar()
}

