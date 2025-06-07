import SwiftUI

struct LocationInfoView: View {
    let location: Location
    var body: some View {
        VStack(
            alignment: .leading,
            spacing: 8
        ) {
            Text(location.name)
                .font(.title2)
                .fontWeight(.bold)
            
            Text("Latitude: \(location.coordinate.latitude)")
                .font(.subheadline)
            
            Text("Longitude: \(location.coordinate.longitude)")
                .font(.subheadline)
        }
        .padding()
        .background {
            RoundedRectangle(cornerRadius: 10)
                .fill(Color.white)
                .shadow(radius: 5)
        }
        .padding()
    }
}
