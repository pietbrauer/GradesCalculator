//
//  ContentView.swift
//  GradeCalculator
//
//  Created by Piet Brauer-Kallenberg on 21.07.21.
//

import SwiftUI

class ContentViewModel: ObservableObject {
    @Published var rise = ""
    @Published var length = ""
    @Published var gradeInPercent: Float = 0.0 {
        didSet {

        }
    }
    var formattedGradeInPercent: String {
        "\(formatter.string(from: NSNumber(value: gradeInPercent)) ?? "–") %"
    }

    private lazy var formatter: NumberFormatter = {
        let formatter = NumberFormatter()
        formatter.notANumberSymbol = "-"
        formatter.numberStyle = .decimal
        formatter.minimumFractionDigits = 2
        formatter.maximumFractionDigits = 2
        formatter.roundingMode = .halfUp
        return formatter
    }()

    func calculate() {
        guard let rise = Float(rise), let length = Float(length),
              rise > 0 && length > 0 else { return }
        let alpha = tan(rise / 1000 / length)
        gradeInPercent = alpha * 100
    }
}

struct ContentView: View {
    @ObservedObject var viewModel = ContentViewModel()

    var body: some View {
        Spacer()
        VStack {
            HStack(alignment: .center) {
                Label("Rise (m)", image: "arrow.up.forward")
                TextField("0,0", text: $viewModel.rise)
                    .onChange(of: viewModel.rise, perform: { _ in
                        self.viewModel.calculate()
                    })
                Spacer()
            }
            HStack {
                Label("Distance (km)", image: "arrow.left.and.right")
                TextField("0,0", text: $viewModel.length)
                    .onChange(of: viewModel.length, perform: { _ in
                        self.viewModel.calculate()
                    })
                Spacer()
            }
            HStack {
                Label("Grade", image: "")
                Text(viewModel.formattedGradeInPercent)
            }
        }
        Spacer()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
