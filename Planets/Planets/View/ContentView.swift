import SwiftUI
import SceneKit

struct ContentView: View {
    @State var planets: [Planet] = [
        Planet(
            id: 0,
            name: "Earth",
            modelName: "Earth.usdz",
            details: "Earth is the third planet from the Sun and the only astronomical object known to harbor life. According to radiometric dating estimation and other evidence, Earth formed over 4.5 billion years ago. Earth's gravity interacts with other objects in space, especially the Sun and the Moon, which is Earth's only natural satellite. Earth orbits around the Sun in 365.256 solar days."),
        Planet(
            id: 0,
            name: "Jupiter",
            modelName: "Jupiter.usdz",
            details: "Jupiter is the largest planet in our solar system at nearly 11 times the size of Earth and 317 times its mass. Jupiter, being the biggest planet, gets its name from the king of the ancient Roman gods."),
        Planet(
            id: 0,
            name: "Mars",
            modelName: "Mars.usdz",
            details: "Mars is the fourth planet from the Sun and is often called the 'Red Planet' due to its reddish appearance, which is caused by iron oxide on its surface. Mars has the tallest volcano in the solar system, Olympus Mons, and deep valleys such as Valles Marineris. It has two small moons, Phobos and Deimos, and is a prime target for exploration due to the possibility of past or present microbial life."),
        Planet(
            id: 0,
            name: "Pluto",
            modelName: "Pluto.usdz",
            details: "Pluto is a dwarf planet located in the Kuiper Belt, a region of icy bodies beyond Neptune. Once considered the ninth planet, Pluto was reclassified in 2006. It has a heart-shaped glacier known as Tombaugh Regio and is primarily composed of ice and rock. Pluto has five known moons, the largest of which is Charon, and it takes about 248 Earth years to complete one orbit around the Sun."),
        Planet(
            id: 0,
            name: "Venus",
            modelName: "Venus.usdz",
            details: "Venus is the second planet from the Sun and is similar in size and structure to Earth, often called Earth's 'sister planet.' It has a thick, toxic atmosphere composed mainly of carbon dioxide, with clouds of sulfuric acid, making it the hottest planet in our solar system due to a runaway greenhouse effect. Venus rotates very slowly and in the opposite direction of most planets."),
    ]
    @State var index = 0
    var body: some View {
        VStack {
            SceneView(
                scene: SCNScene(named: planets[index].modelName),
                options: [.autoenablesDefaultLighting, .allowsCameraControl]
            )
            .frame(
                width: UIScreen.main.bounds.width,
                height: UIScreen.main.bounds.height / 2
            )
            
            ZStack {
                HStack {
                    Button {
                        withAnimation {
                            if index > 0 {
                                index -= 1
                            }
                        }
                    } label: {
                        Image(systemName: "chevron.left")
                            .font(
                                .system(
                                    size: 35,
                                    weight: .bold
                                )
                            )
                            .opacity(index == 0 ? 0.3 : 1)
                    }
                    .disabled(index == 0 ? true : false)
                    
                    Spacer(minLength: 0)
                    
                    Button {
                        withAnimation {
                            if index < planets.count {
                                index += 1
                            }
                        }
                    } label: {
                        Image(systemName: "chevron.right")
                            .font(
                                .system(
                                    size: 35,
                                    weight: .bold
                                )
                            )
                            .opacity(index == planets.count - 1 ? 0.3 : 1)
                    }
                    .disabled(index == planets.count - 1 ? true : false)
                }
                
                Text(planets[index].name)
                    .font(
                        .system(
                            size: 45,
                            weight: .bold
                        )
                    )
            }
            .foregroundStyle(.black)
            .padding(.horizontal)
            .padding(
                .vertical,
                30
            )
            
            VStack(
                alignment: .leading,
                spacing: 15
            ) {
                Text("About")
                    .font(.title2.bold())
                
                Text(planets[index].details)
            }
            .padding(.horizontal)
            
            Spacer(minLength: 0)
        }
    }
}

#Preview {
    ContentView()
}
