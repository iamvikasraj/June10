//import SwiftUI
//
//struct DrawToggleView: View {
//    @State private var isFirst = false
//    @State private var isSecond = false
//    @State private var isThird = false
//    
//
//    var body: some View {
//        ZStack {
//            // 🌈 Animated mesh gradient
//            AnimatedMeshGradient3x3()
//
//            // 📱 Bottom Nav Bar
//            VStack {
//                Spacer()
//                
//                HStack(spacing: 24) {
//                    // ⬆️ Toggle Button
//                    ZStack {
//                        Image(systemName: "arrow.up.circle")
//                            .symbolEffect(.drawOn, isActive: isFirst)
//                            .font(.system(size: 28))
//                            .opacity(isFirst ? 0 : 1)
//
//                        Image(systemName: "arrow.down.circle")
//                            .symbolEffect(.drawOff, isActive: !isFirst)
//                            .font(.system(size: 28))
//                            .opacity(isFirst ? 1 : 0)
//                    }
//                    .onTapGesture {
//                        isFirst.toggle()
//                    }
//
////                    Spacer()
//                    
//                    // Placeholder icons (replace as needed)
//                    ZStack {
//                        Image(systemName: "rectangle.portrait.and.arrow.forward")
//                            .symbolEffect(.drawOn, isActive: isSecond)
//                            .font(.system(size: 28))
//                            .opacity(isSecond ? 0 : 1)
//
//                        Image(systemName: "rectangle.portrait.and.arrow.forward")
//                            .symbolEffect(.drawOff, isActive: !isSecond)
//                            .font(.system(size: 28))
//                            .opacity(isSecond ? 1 : 0)
//                    }
//                    .onTapGesture {
//                        isSecond.toggle()
//                    }
//
////                    Spacer()
//                    ZStack {
//                        Image(systemName: "person.circle")
//                            .symbolEffect(.drawOn, isActive: isThird)
//                            .font(.system(size: 28))
//                            .opacity(isThird ? 0 : 1)
//
//                        Image(systemName: "person.circle")
//                            .symbolEffect(.drawOff, isActive: !isThird)
//                            .font(.system(size: 28))
//                            .opacity(isThird ? 1 : 0)
//                    }
//                    .onTapGesture {
//                        isThird.toggle()
//                    }
//                }
//                .padding()
//                .glassEffect()
//                .clipShape(RoundedRectangle(cornerRadius: 30, style: .continuous))
//                .padding(.horizontal, 80)
//                .padding(.bottom, 30)
//            }
//        }
////        .ignoresSafeArea()
//    }
//}
//
//#Preview {
//    DrawToggleView()
//}
//
//// 🔮 Animated mesh background
//struct AnimatedMeshGradient3x3: View {
//    @State private var animatePoints = false
//
//    var body: some View {
//            ZStack {
//                MeshGradient(
//                    width: 3,
//                    height: 3,
//                    points:
//                    animatePoints ?
//                    [
//                    [0.0, 0.0], [0.5, 0.0], [1.0, 0.0],
//                    [0.0, 0.5], [0.5, 0.5], [1.0, 0.5],
//                    [0.0, 1.0], [1.0, 1.0], [1.0, 1.0]
//                    ] : [
//                    [0.0, 0.0], [0.5, 0.0], [1.0, 0.0],
//                    [0.0, 0.5], [0.5, 0.5], [1.0, 0.5],
//                    [0.0, 1.0], [1.0, 1.0], [1.0, 1.0]
//                    ],
//                    colors: [
//                        Color(red: 0.7, green: 0.85, blue: 1.0),    // Light Blue
//                        Color(red: 1.0, green: 0.8, blue: 0.6),     // Peach
//                        Color(red: 1.0, green: 0.7, blue: 0.9),     // Baby Pink
//                        Color(red: 0.85, green: 0.7, blue: 1.0),    // Lavender
//
//                        Color(red: 0.8, green: 0.9, blue: 1.0),     // Soft Sky Blue
//                        Color(red: 1.0, green: 0.75, blue: 0.85),   // Light Rose
//                        Color(red: 0.85, green: 0.75, blue: 1.0),   // Pastel Purple
//                        Color(red: 0.7, green: 0.85, blue: 1.0),    // Light Blue again
//
//                        Color(red: 0.9, green: 0.95, blue: 1.0),    // Very Light Blue
//                        Color(red: 0.95, green: 0.9, blue: 1.0),    // Lilac Mist
//                        Color(red: 0.85, green: 0.95, blue: 1.0),   // Icy Blue
//                        Color(red: 0.8, green: 0.9, blue: 1.0)       // Sky Mist
//                    ]
//                )
//                .ignoresSafeArea()
////                .onAppear {
////                    withAnimation(.easeInOut(duration: 4).repeatForever(autoreverses: true)) {
////                        animatePoints.toggle()
////                    }
////                }
//            }
//        }
//}
//
