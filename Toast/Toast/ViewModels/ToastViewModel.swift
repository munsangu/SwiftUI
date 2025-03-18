import SwiftUI

class ToastViewModel: ObservableObject {
    @Published var toasts: [Toast] = []
    
    func addAirpodsBatteryLowToast() {
        withAnimation(.bouncy) {
            let toast = Toast { id in
                AirpodsToastView(
                    id: id,
                    icon: "bolt.slash.fill",
                    message: "Your Airpods Battery is low.",
                    color: .red,
                    onClose: { [weak self] in
                        self?.removeToast(id: id)
                    }
                )
            }
            toasts.append(toast)
        }
    }
    
    func addAirpodsFullyChargedToast() {
        withAnimation(.bouncy) {
            let toast = Toast { id in
                AirpodsToastView(
                    id: id,
                    icon: "bolt.fill",
                    message: "Airpods is fully charged.",
                    color: .green,
                    onClose: { [weak self] in
                        self?.removeToast(id: id)
                    }
                )
            }
            toasts.append(toast)
        }
    }
    
    func addAirpodsOptimizedChargingToast() {
        withAnimation(.bouncy) {
            let toast = Toast { id in
                AirpodsToastView(
                    id: id,
                    icon: "heart.fill",
                    message: "Optmized Airpods charging.",
                    color: .yellow,
                    onClose: { [weak self] in
                        self?.removeToast(id: id)
                    }
                )
            }
            toasts.append(toast)
        }
    }
    
    func addUserAirpodsToast(userName: String) {
        withAnimation(.bouncy) {
            let toast = Toast { id in
                AirpodsToastView(
                    id: id,
                    icon: "airpodspro",
                    message: "\(userName)'s Airpods",
                    color: .gray,
                    showCloseButton: false,
                    onClose: { [weak self] in
                        self?.removeToast(id: id)
                    }
                )
            }
            toasts.append(toast)
        }
    }
    
    func addToast(type: ToastType) {
        withAnimation(.bouncy) {
            let toast = Toast { id in
                ToastItemView(id: id, type: type, onClose: { [weak self] in
                    self?.removeToast(id: id)
                })
            }
            toasts.append(toast)
        }
    }
    
    func removeToast(id: String) {
        if let index = toasts.firstIndex(where: { $0.id == id }) {
            toasts[index].isDeleting = true
            
            withAnimation(.bouncy) {
                toasts.removeAll(where: { $0.id == id })
            }
        }
    }
}
