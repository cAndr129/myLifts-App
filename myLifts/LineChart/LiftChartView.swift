import SwiftUI

struct LiftChartView: View {
  @State var dataPoints: [Double] = [15, 2, 7, 16, 32, 39, 5, 3, 25, 21]

  var body: some View {
    LineChartView(dataPoints: dataPoints)
      .frame(height: 200)
      .padding(4)
      .background(Color.gray.opacity(0.1).cornerRadius(16))
      .padding()
  }
}
