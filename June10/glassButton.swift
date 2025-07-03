import SwiftUI

extension Color {
    // Background gradient
    static let customGradient = LinearGradient(
        gradient: Gradient(stops: [
            .init(color: Color(red: 67/255, green: 80/255, blue: 89/255), location: 0.0),
            .init(color: Color(red: 93/255, green: 106/255, blue: 114/255), location: 0.19),
            .init(color: Color(red: 120/255, green: 133/255, blue: 141/255), location: 0.59),
            .init(color: Color(red: 116/255, green: 123/255, blue: 129/255), location: 1.0)
        ]),
        startPoint: .topLeading,
        endPoint: .bottomTrailing
    )
    
    // Button fill color
    static let buttonFill = Color(red: 120/255, green: 133/255, blue: 141/255)
    
    // Outermost stroke color
    static let outerStroke = Color(red: 95/255, green: 106/255, blue: 111/255)
    
    // Inner stroke gradients
    static let innerStroke1 = LinearGradient(
        gradient: Gradient(stops: [
            .init(color: Color(red: 251/255, green: 252/255, blue: 254/255), location: 0.0),
            .init(color: Color(red: 102/255, green: 102/255, blue: 102/255).opacity(0.0), location: 1.0)
        ]),
        startPoint: .top,
        endPoint: .bottom
    )
    
    static let innerStroke2 = LinearGradient(
        gradient: Gradient(stops: [
            .init(color: Color(red: 0/255, green: 0/255, blue: 0/255).opacity(0.0), location: 0.0),
            .init(color: Color(red: 254/255, green: 254/255, blue: 253/255), location: 1.0)
        ]),
        startPoint: .leading,
        endPoint: .trailing
    )
    
    static let innerStroke3 = LinearGradient(
        gradient: Gradient(stops: [
            .init(color: Color(red: 0/255, green: 0/255, blue: 0/255).opacity(0.0), location: 0.0),
            .init(color: Color(red: 82/255, green: 92/255, blue: 101/255), location: 1.0)
        ]),
        startPoint: .bottomLeading,
        endPoint: .topTrailing
    )
    
    static let innerStroke4 = LinearGradient(
        gradient: Gradient(stops: [
            .init(color: Color(red: 0/255, green: 0/255, blue: 0/255).opacity(0.0), location: 0.0),
            .init(color: Color(red: 82/255, green: 92/255, blue: 101/255), location: 1.0)
        ]),
        startPoint: .top,
        endPoint: .bottom
    )
}

struct MultiStrokeButton: View {
    @State private var isPressed = false
    
    var body: some View {
        Button(action: {
            print("Multi-stroke button tapped!")
        }) {
            Image("arrow")
                .foregroundColor(.white)
                .shadow(radius: isPressed ? 2 : 4, y: isPressed ? 2 : 12)
                .animation(.bouncy, value: isPressed)
                .frame(width: 125, height: 125)
                .background(Color.buttonFill)
                .clipShape(RoundedRectangle(cornerRadius: 80))
                .shadow(radius: 8, y: 24)
            
                
                // Inner stroke 1: Top to bottom gradient
                .overlay(
                    RoundedRectangle(cornerRadius: 80)
                        .strokeBorder(Color.innerStroke1, lineWidth: 2)
                        .blendMode(.darken)
                )
                
                // Inner stroke 2: Left to right gradient
                .overlay(
                    RoundedRectangle(cornerRadius: 80)
                        .strokeBorder(Color.innerStroke2, lineWidth: 3)
                        .blendMode(.overlay)
                )
                
                // Inner stroke 3: Bottom-left to top-right gradient
                .overlay(
                    RoundedRectangle(cornerRadius: 80)
                        .strokeBorder(Color.innerStroke3, lineWidth: 2)
                        .blendMode(.overlay)
                )
                
                // Inner stroke 4: Top to bottom gradient
                .overlay(
                    RoundedRectangle(cornerRadius: 80)
                        .strokeBorder(Color.innerStroke4, lineWidth: 2)
                        .blendMode(.overlay)
                )
                
                // Outermost stroke
                .overlay(
                    RoundedRectangle(cornerRadius: 80)
                        .stroke(Color.outerStroke, lineWidth: 1.75)
                )
        }
        .shadow(radius: isPressed ? 4 : 8, y: isPressed ? 8 : 24)
        .animation(.bouncy, value: isPressed)
        .onPressGesture(
            pressing: { pressing in
                isPressed = pressing
            },
            perform: {}
        )
    }
}

// Extension for press gesture
extension View {
    func onPressGesture(pressing: @escaping (Bool) -> Void, perform: @escaping () -> Void) -> some View {
        self.simultaneousGesture(
            DragGesture(minimumDistance: 0)
                .onChanged { _ in
                    pressing(true)
                }
                .onEnded { _ in
                    pressing(false)
                    perform()
                }
        )
    }
}

struct GlassButton: View {
    var body: some View {
        VStack {
            MultiStrokeButton()
                .buttonStyle(.plain)
                
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.customGradient)
    }
}

#Preview {
    GlassButton()
}
