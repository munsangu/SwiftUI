import SwiftUI

struct HeaderView: View {
    let currentWeek: [Date.Day]
    let selectedDate: Date?
    let onDateSelected: (Date) -> Void
    var namespace: Namespace.ID

    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            HStack {
                Text("This Week")
                    .font(.title.bold())
                Spacer(minLength: 0)
                Button {
                    // 기능 없음
                } label: {
                    Image(.thanos)
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 35, height: 35)
                        .clipShape(.circle)
                }
            }

            HStack(spacing: 0) {
                ForEach(currentWeek) { day in
                    let date = day.date
                    let isSameDate = date.isSame(selectedDate)

                    VStack(spacing: 6) {
                        Text(date.string("EEE"))
                            .font(.caption)

                        Text(date.string("dd"))
                            .font(.title3)
                            .fontWeight(.semibold)
                            .foregroundStyle(isSameDate ? .black : .white)
                            .frame(width: 38, height: 38)
                            .background {
                                if isSameDate {
                                    Circle()
                                        .fill(.white)
                                        .matchedGeometryEffect(id: "ACTIVEDATE", in: namespace)
                                }
                            }
                    }
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .contentShape(.rect)
                    .onTapGesture {
                        onDateSelected(date)
                    }
                }
            }
            .animation(.snappy(duration: 0.25, extraBounce: 0), value: selectedDate)
            .frame(height: 80)
            .padding(.vertical, 5)
            .offset(y: 5)

            HStack {
                Text(selectedDate?.string("MMM") ?? "")
                Spacer(minLength: 0)
                Text(selectedDate?.string("YYYY") ?? "")
            }
            .font(.caption2)
        }
        .padding([.horizontal, .top], 15)
        .padding(.bottom, 10)
    }
}

#Preview {
    @Previewable @Namespace var namespace

    return HeaderView(
        currentWeek: Date.currentWeek,
        selectedDate: Date(),
        onDateSelected: { _ in },
        namespace: namespace
    )
    .background(Color.black)
}
