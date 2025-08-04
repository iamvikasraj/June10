// MARK: - DesignSystem.swift
// Consolidated design tokens for fonts, colors, typography, spacing, and animations

import SwiftUI

// MARK: - Design System
struct DesignSystem {
    
    // MARK: - Typography & Fonts
    struct Typography {
        // Display fonts
        static let largeNumber = Font.system(size: 180, design: .monospaced).weight(.bold)
        static let displayLarge = Font.system(size: 48, weight: .bold)
        static let displayMedium = Font.system(size: 36, weight: .semibold)
        static let displaySmall = Font.system(size: 24, weight: .semibold)
        
        // Body fonts
        static let bodyLarge = Font.system(size: 18, weight: .regular)
        static let bodyMedium = Font.system(size: 16, weight: .regular)
        static let bodySmall = Font.system(size: 14, weight: .regular)
        
        // Button & UI fonts
        static let buttonText = Font.system(size: 16, weight: .regular, design: .monospaced)
        static let buttonLarge = Font.system(size: 18, weight: .medium)
        static let buttonSmall = Font.system(size: 14, weight: .medium)
        
        // Navigation & Tab fonts
        static let tabTitle = Font.caption2
        static let tabIcon = Font.system(size: 20)
        static let tabIconLarge = Font.system(size: 28)
        static let navTitle = Font.system(size: 20, weight: .semibold)
        
        // Caption & Label fonts
        static let caption = Font.caption
        static let captionSmall = Font.system(size: 10, weight: .regular)
        static let label = Font.system(size: 12, weight: .medium)
    }
    
    // MARK: - Colors
    struct Colors {
        // MARK: - Primary Colors
        static let primary = Color.blue
        static let primaryVariant = Color.blue.opacity(0.8)
        static let secondary = Color.purple
        static let secondaryVariant = Color.purple.opacity(0.6)
        
        // MARK: - Neutral Colors
        static let background = Color(red: 203/255, green: 203/255, blue: 205/255)
        static let surface = Color.white
        static let surfaceVariant = Color.gray.opacity(0.1)
        
        // MARK: - Text Colors
        static let onPrimary = Color.white
        static let onSecondary = Color.white
        static let onBackground = Color.black
        static let onSurface = Color.black
        static let textPrimary = Color.black
        static let textSecondary = Color.gray
        static let textTertiary = Color.gray.opacity(0.6)
        
        // MARK: - Glass Effect Colors
        static let buttonFill = Color(red: 125/255, green: 135/255, blue: 140/255).opacity(0.00)
        static let glassyButtonFill = Color.black.opacity(1.0)
        static let glassSurface = Color.white.opacity(0.1)
        static let glassStroke = Color.white.opacity(0.2)
        
        // MARK: - Status Colors
        static let success = Color.green
        static let warning = Color.orange
        static let error = Color.red
        static let info = Color.blue
        
        // MARK: - Background Gradients
        static let frostedBackground = LinearGradient(
            colors: [
                Color(red: 0.9, green: 0.9, blue: 0.9),
                Color(red: 0.8, green: 0.82, blue: 0.85)
            ],
            startPoint: .topLeading,
            endPoint: .bottomTrailing
        )
        
        static let primaryGradient = LinearGradient(
            colors: [Color.blue, Color.purple],
            startPoint: .topLeading,
            endPoint: .bottomTrailing
        )
        
        // MARK: - Mesh Gradient Colors
        static let meshColors: [Color] = [
            Color(red: 0.7, green: 0.85, blue: 1.0),    // Light Blue
            Color(red: 1.0, green: 0.8, blue: 0.6),     // Peach
            Color(red: 1.0, green: 0.7, blue: 0.9),     // Baby Pink
            Color(red: 0.85, green: 0.7, blue: 1.0),    // Lavender
            Color(red: 0.8, green: 0.9, blue: 1.0),     // Soft Sky Blue
            Color(red: 1.0, green: 0.75, blue: 0.85),   // Light Rose
            Color(red: 0.85, green: 0.75, blue: 1.0),   // Pastel Purple
            Color(red: 0.7, green: 0.85, blue: 1.0),    // Light Blue again
            Color(red: 0.9, green: 0.95, blue: 1.0),    // Very Light Blue
            Color(red: 0.95, green: 0.9, blue: 1.0),    // Lilac Mist
            Color(red: 0.85, green: 0.95, blue: 1.0),   // Icy Blue
            Color(red: 0.8, green: 0.9, blue: 1.0)      // Sky Mist
        ]
    }
    
    // MARK: - Spacing
    struct Spacing {
        // Base spacing scale
        static let xs: CGFloat = 4
        static let sm: CGFloat = 8
        static let md: CGFloat = 16
        static let lg: CGFloat = 24
        static let xl: CGFloat = 32
        static let xxl: CGFloat = 40
        static let xxxl: CGFloat = 48
        
        // Component specific spacing
        static let buttonHorizontal: CGFloat = 20
        static let buttonVertical: CGFloat = 20
        static let buttonIconSpacing: CGFloat = 12
        static let tabBarSpacing: CGFloat = 24
        static let tabIconSpacing: CGFloat = 4
        static let cardPadding: CGFloat = 16
        static let screenMargin: CGFloat = 20
    }
    
    // MARK: - Corner Radius
    struct CornerRadius {
        static let small: CGFloat = 8
        static let medium: CGFloat = 16
        static let large: CGFloat = 24
        static let xlarge: CGFloat = 32
        static let pill: CGFloat = 200  // For pill-shaped buttons
        static let circle: CGFloat = 999 // For circular elements
    }
    
    // MARK: - Shadows
    struct Shadow {
        static let small = (color: Color.black.opacity(0.1), radius: CGFloat(2), x: CGFloat(0), y: CGFloat(1))
        static let medium = (color: Color.black.opacity(0.15), radius: CGFloat(4), x: CGFloat(0), y: CGFloat(2))
        static let large = (color: Color.black.opacity(0.2), radius: CGFloat(8), x: CGFloat(0), y: CGFloat(4))
        static let button = (color: Color.black.opacity(0.25), radius: CGFloat(8), x: CGFloat(0), y: CGFloat(12))
        static let buttonPressed = (color: Color.black.opacity(0.1), radius: CGFloat(4), x: CGFloat(0), y: CGFloat(8))
    }
    
    // MARK: - Animations
    struct Animations {
        static let fast = Animation.easeInOut(duration: 0.2)
        static let medium = Animation.easeInOut(duration: 0.3)
        static let slow = Animation.easeInOut(duration: 0.5)
        
        static let buttonPress = Animation.spring(duration: 0.5)
        static let contentTransition = Animation.spring(response: 0.6, dampingFraction: 0.8)
        static let sliderEdit = Animation.easeInOut(duration: 0.3)
        static let meshAnimation = Animation.easeInOut(duration: 4).repeatForever(autoreverses: true)
        
        // Scale values
        static let pressedScale: CGFloat = 0.8
        static let hoverScale: CGFloat = 1.05
        static let editingScale: CGFloat = 1.1
    }
    
    // MARK: - Stroke Gradients
    struct StrokeGradients {
        static let topToBottom = LinearGradient(
            gradient: Gradient(stops: [
                .init(color: Color.white.opacity(0.9), location: 0.0),
                .init(color: Color.white.opacity(0.1), location: 0.4)
            ]),
            startPoint: .top,
            endPoint: .bottom
        )
        
        static let bottomToTop = LinearGradient(
            gradient: Gradient(stops: [
                .init(color: Color.white.opacity(0.7), location: 0.0),
                .init(color: Color.white.opacity(0.0), location: 0.3)
            ]),
            startPoint: .bottom,
            endPoint: .top
        )
        
        static let leftToTop = LinearGradient(
            gradient: Gradient(stops: [
                .init(color: Color.black.opacity(0.08), location: 0.0),
                .init(color: Color.black.opacity(0.0), location: 0.3)
            ]),
            startPoint: .leading,
            endPoint: .topTrailing
        )
        
        static let rightToTop = LinearGradient(
            gradient: Gradient(stops: [
                .init(color: Color.black.opacity(0.12), location: 0.0),
                .init(color: Color.black.opacity(0.0), location: 0.25)
            ]),
            startPoint: .trailing,
            endPoint: .topLeading
        )
    }
}

// MARK: - Button Configuration
struct ButtonConfiguration {
    let cornerRadius: CGFloat
    let strokeWidth: CGFloat
    let shadowRadius: CGFloat
    let blurRadius: CGFloat
    
    static let `default` = ButtonConfiguration(
        cornerRadius: DesignSystem.CornerRadius.pill,
        strokeWidth: 2,
        shadowRadius: 8,
        blurRadius: 8
    )
    
    static let rounded = ButtonConfiguration(
        cornerRadius: DesignSystem.CornerRadius.medium,
        strokeWidth: 1,
        shadowRadius: 4,
        blurRadius: 4
    )
    
    static let small = ButtonConfiguration(
        cornerRadius: DesignSystem.CornerRadius.small,
        strokeWidth: 1,
        shadowRadius: 2,
        blurRadius: 2
    )
}

// MARK: - Convenience Extensions
extension Color {
    // Quick access to design system colors
    static let ds = DesignSystem.Colors.self
}

extension Font {
    // Quick access to design system typography
    static let ds = DesignSystem.Typography.self
}

extension Animation {
    // Quick access to design system animations
    static let ds = DesignSystem.Animations.self
}

// MARK: - View Modifiers
struct GlassEffectModifier: ViewModifier {
    let cornerRadius: CGFloat
    
    init(cornerRadius: CGFloat = DesignSystem.CornerRadius.large) {
        self.cornerRadius = cornerRadius
    }
    
    func body(content: Content) -> some View {
        content
            .background(.ultraThinMaterial)
            .clipShape(RoundedRectangle(cornerRadius: cornerRadius, style: .continuous))
            .overlay(
                RoundedRectangle(cornerRadius: cornerRadius, style: .continuous)
                    .stroke(DesignSystem.Colors.glassStroke, lineWidth: 1)
            )
            .shadow(
                color: DesignSystem.Shadow.medium.color,
                radius: DesignSystem.Shadow.medium.radius,
                x: DesignSystem.Shadow.medium.x,
                y: DesignSystem.Shadow.medium.y
            )
    }
}

struct PressGestureModifier: ViewModifier {
    let pressing: (Bool) -> Void
    let perform: () -> Void
    
    func body(content: Content) -> some View {
        content
            .simultaneousGesture(
                DragGesture(minimumDistance: 0)
                    .onChanged { _ in pressing(true) }
                    .onEnded { _ in
                        pressing(false)
                        perform()
                    }
            )
    }
}


