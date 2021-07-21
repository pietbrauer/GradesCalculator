//
//  ContentView.swift
//  GradeCalculator
//
//  Created by Piet Brauer-Kallenberg on 21.07.21.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var viewModel = ContentViewModel()

    var body: some View {
        Spacer()
        VStack {
            Spacer()
            Text("content.title")
                .font(.largeTitle)
            Spacer()
            HStack {
                Spacer()
                VStack(alignment: .leading, spacing: 10) {
                    Label("content.rise.label", systemImage: "arrow.up.forward")
                        .font(.headline)
                    Label("content.distance.label", systemImage: "arrow.left.and.right")
                        .font(.headline)
                }
                VStack {
                    TextField("0,0", text: $viewModel.rise)
                        .onChange(of: viewModel.rise, perform: { _ in
                            self.viewModel.calculate()
                        })
                    TextField("0,0", text: $viewModel.length)
                        .onChange(of: viewModel.length, perform: { _ in
                            self.viewModel.calculate()
                        })
                }
                Spacer()
            }
            Spacer()
            HStack {
                Label("content.grade.label", systemImage: "triangle")
                    .font(.title3)
                Text(viewModel.formattedGradeInPercent)
            }
            Spacer()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
