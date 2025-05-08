import SwiftUI
import AVKit

struct WaveformScrubber: View {
    var config: Config = .init()
    var url: URL
    @Binding var progress: CGFloat
    var info: (AudioInfo) -> () = { _ in }
    var onGestureActive: (Bool) -> () = { _ in }
    @State private var samples: [Float] = []
    @State private var dowsizedSamples: [Float] = []
    @State private var viewSize: CGSize = .zero
    @State private var lastProgress: CGFloat = 0
    @GestureState private var isActive: Bool = false
    var body: some View {
        ZStack {
            WaveformShape(samples: dowsizedSamples)
                .fill(config.inActiveTint)
            
            WaveformShape(samples: dowsizedSamples)
                .fill(config.activeTint)
                .mask {
                    Rectangle()
                        .scaleEffect(
                            x: progress,
                            anchor: .leading
                        )
                }
        }
        .frame(maxWidth: .infinity)
        .contentShape(.rect)
        .gesture(
            DragGesture()
                .updating($isActive) { _, out, _ in
                    out = true
                }.onChanged({ value in
                    let progress = max(min((value.translation.width / viewSize.width) + lastProgress, 1), 0)
                    self.progress = progress
                }).onEnded({ _ in
                    lastProgress = progress
                })
        )
        .onChange(of: progress, { oldValue, newValue in
            guard !isActive else { return }
            lastProgress = newValue
        })
        .onChange(of: isActive, { oldValue, newValue in
            onGestureActive(newValue)
        })
        .onGeometryChange(for: CGSize.self) {
            $0.size
        } action: { newValue in
            if viewSize == .zero {
                lastProgress = progress
            }
            viewSize = newValue
            initializeAudioFile(newValue)
        }
    }
}

extension WaveformScrubber {
    private func initializeAudioFile(_ size: CGSize) {
        guard samples.isEmpty else { return }
        
        Task.detached(priority: .high) {
            do {
                let audioFile = try AVAudioFile(forReading: url)
                let audioInfo = extractAudioInfo(audioFile)
                let samples = try extarctAudioSamples(audioFile)
                
                let downSampleCount = Int(Float(size.width) / (config.spacing + config.shapeWidth))
                let downSamples = downSampleAudioSamples(samples, downSampleCount)
                await MainActor.run {
                    self.samples = samples
                    self.dowsizedSamples = downSamples
                    self.info(audioInfo)
                }
            } catch {
                print(error.localizedDescription)
            }
        }
    }
    
    nonisolated func extarctAudioSamples(_ file: AVAudioFile) throws -> [Float] {
        let format = file.processingFormat
        let frameCount = UInt32(file.length)
        
        guard let buffer = AVAudioPCMBuffer(
            pcmFormat: format,
            frameCapacity: frameCount
        ) else {
            return []
        }
        
        try file.read(into: buffer)
        
        if let channel = buffer.floatChannelData {
            let samples = Array(UnsafeBufferPointer(start: channel[0], count: Int(buffer.frameLength)))
            return samples
        }
        
        return []
    }
    
    nonisolated func downSampleAudioSamples(_ samples: [Float], _ count: Int) -> [Float] {
        let chunk = samples.count / count
        var downSampled: [Float] = []
        
        for index in 0..<count {
            let start = index * chunk
            let end = min((index + 1) * chunk, samples.count)
            let chunkSamples = samples[start..<end]
            
            let maxValue = chunkSamples.max() ?? 0
            downSampled.append(maxValue)
        }
        
        return downSampled
    }
    
    nonisolated func extractAudioInfo(_ file: AVAudioFile) -> AudioInfo {
        let format = file.processingFormat
        let sampleRate = format.sampleRate
        
        let duration = file.length / Int64(sampleRate)
        
        return .init(duration: TimeInterval(duration))
    }
}
