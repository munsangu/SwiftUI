import SwiftUI

struct ContentView: View {
    @ObservedObject var viewModel: MVCViewModel
    
    var body: some View {
        VStack(spacing: 20) {
            Text("MVC Pattern Explanation")
                .font(.largeTitle)
                .fontWeight(.bold)
            
            HStack(spacing: 30) {
                ForEach(MVCType.allCases) { component in
                    Button(action: {
                        viewModel.select(component)
                    }) {
                        Text(component.rawValue)
                            .font(.headline)
                            .foregroundColor(.white)
                            .padding()
                            .frame(width: 100)
                            .background(
                                RoundedRectangle(cornerRadius: 12)
                                    .fill(color(for: component))
                            )
                    }
                }
            }
            
            if let selected = viewModel.selectedComponent {
                VStack(spacing: 15) {
                    Text(selected.rawValue)
                        .font(.title)
                        .fontWeight(.bold)
                        .foregroundColor(color(for: selected))
                    
                    Text(selected.description)
                        .multilineTextAlignment(.center)
                        .padding(.horizontal)
                }
                .padding()
                .background(
                    RoundedRectangle(cornerRadius: 16)
                        .fill(Color.gray.opacity(0.1))
                )
                .transition(.scale)
            }
            
            Spacer()
            
            if viewModel.showDataFlow {
                DataFlowView()
                    .transition(.move(edge: .bottom))
            }
            
            Spacer()
            
            if viewModel.selectedComponent != nil {
                Button("Reset") {
                    viewModel.resetSelection()
                }
                .foregroundColor(.blue)
            }
        }
        .padding()
        .animation(.spring(), value: viewModel.selectedComponent)
    }
    
    func color(for type: MVCType) -> Color {
        switch type {
        case .model: return .orange
        case .view: return .green
        case .controller: return .purple
        }
    }
}

struct DataFlowView: View {
    var body: some View {
        VStack(spacing: 10) {
            Text("Data Flow")
                .font(.headline)
                .padding(.bottom, 5)
            
            HStack(spacing: 10) {
                Text("View")
                    .padding(10)
                    .background(Circle().fill(Color.green))
                Image(systemName: "arrow.right")
                Text("Controller")
                    .padding(10)
                    .background(Circle().fill(Color.purple))
                Image(systemName: "arrow.right")
                Text("Model")
                    .padding(10)
                    .background(Circle().fill(Color.orange))
            }
            
            HStack(spacing: 10) {
                Text("Model")
                    .padding(10)
                    .background(Circle().fill(Color.orange))
                Image(systemName: "arrow.right")
                Text("Controller")
                    .padding(10)
                    .background(Circle().fill(Color.purple))
                Image(systemName: "arrow.right")
                Text("View")
                    .padding(10)
                    .background(Circle().fill(Color.green))
            }
        }
        .font(.subheadline)
        .padding()
        .background(
            RoundedRectangle(cornerRadius: 16)
                .fill(Color.gray.opacity(0.1))
        )
    }
}
