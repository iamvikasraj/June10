//
//  InteractiveGrayDemoView.swift
//  June10
//
//  Created by Vikas Raj on 09/09/25.
//

import SwiftUI

// MARK: - Public entry view
struct InteractiveGrayDemoView: View {
    // Consult card visible initially
    @State private var isConsultCardVisible: Bool = true
    // Bottom sticky card visibility
    @State private var isBottomCardVisible: Bool = false
    // Programmatic navigation state
    @State private var navigateToConsult: Bool = false

    var body: some View {
        NavigationStack {
            ZStack {
                // Main scrolling content
                ScrollView(.vertical, showsIndicators: false) {
                    VStack(spacing: 0) {
                        HeaderView()
                        
                        if isConsultCardVisible {
                            CardView()
                                .padding(20)
                                .transition(.move(edge: .top).combined(with: .opacity))
                                .onAppear {
                                    // Auto-dismiss after 2 seconds
                                    DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
                                        withAnimation(.spring(response: 0.5, dampingFraction: 0.8)) {
                                            isConsultCardVisible = false
                                        }
                                        // Show bottom sticky after slight delay
                                        DispatchQueue.main.asyncAfter(deadline: .now() + 0.28) {
                                            withAnimation(.spring(response: 0.5, dampingFraction: 0.8)) {
                                                isBottomCardVisible = true
                                            }
                                        }
                                    }
                                }
                        }

                        OfferingsView()
//                            .padding(.top, 16)

                        Spacer(minLength: 100)
                    }
                }
                .padding(0)
                .background(Color(red: 0.97, green: 0.96, blue: 0.92))


                // Bottom sticky area
                VStack {
                    Spacer()
                    if isBottomCardVisible {
                        BottomStickyCardView {
                            // onChevronTap: hide sticky then navigate
                            withAnimation(.spring(response: 0.5, dampingFraction: 0.8)) {
                                isBottomCardVisible = false
                            }
                            DispatchQueue.main.asyncAfter(deadline: .now() + 0.12) {
                                navigateToConsult = true
                            }
                        }
                        .padding(.horizontal, 20)
                        .padding(.bottom, 20)
                        .transition(.move(edge: .bottom).combined(with: .opacity))
                    }
                }
            }
            // present destination when navigateToConsult toggles true
            .navigationDestination(isPresented: $navigateToConsult) {
                ConsultDetailView()
                    .onDisappear {
                        // re-show bottom sticky when popping back
                        withAnimation(.spring(response: 0.5, dampingFraction: 0.8)) {
                            isBottomCardVisible = true
                        }
                    }
            }
            .ignoresSafeArea(.all, edges: .top)
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

// MARK: - HeaderView
private struct HeaderView: View {
    // Colors used in the design
    private let bgColor = Color(red: 0.02, green: 0.36, blue: 0.3)
    private let surfaceColor = Color(red: 0.05, green: 0.47, blue: 0.39)
    private let accentTextBlock = Color(red: 0.03, green: 0.31, blue: 0.25)
    
    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            // Top navigation bar with status indicator and profile
            HStack(alignment: .center) {
                // Status indicator badge
                ZStack {
                    // Status content placeholder
                }
                .frame(width: 48, height: 24)
                .background(surfaceColor)
                Spacer()
                
                // Profile avatar
                Image("Oval")
                  .frame(width: 30.0125, height: 30.0125)
                  .background(Color(red: 0.03, green: 0.31, blue: 0.25))
                  .overlay(
                    Rectangle()
                      .stroke(Color(red: 0.03, green: 0.31, blue: 0.25), lineWidth: 2)
                  )
                
            }
            .padding(.horizontal, 0)
            .padding(.vertical, 0)
            .frame(maxWidth: .infinity, alignment: .center)
           
            
            // Title section
            HStack(alignment: .center) {
                // Title text placeholder
                ZStack {
                    // Title content placeholder
                }
                .frame(width: 87, height: 16)
                .background(surfaceColor)
                Spacer()
                
            }
            .padding(.horizontal, 0)
            .padding(.vertical, 0)
            .frame(maxWidth: .infinity, alignment: .center)
            // Main consultation card
            HStack(alignment: .center, spacing: 16){
                
                // Doctor avatar
                RoundedRectangle(cornerRadius: 12)
                .foregroundColor(.white)
                .frame(width: 50, height: 50)
                
                // Doctor info text
                VStack(alignment:.leading){
                    // Doctor name placeholder
                    ZStack {  }
                    .frame(width: 153, height: 16)
                    .background(Color(red: 0.03, green: 0.31, blue: 0.25))
                    
                    // Specialization placeholder
                    ZStack { }
                    .frame(width: 93, height: 16)
                    .background(Color(red: 0.03, green: 0.31, blue: 0.25))
                }
                Spacer()
                
                // Navigation chevron
                Image(systemName: "chevron.right")
                    .font(Font.system(size: 16))
                    .foregroundColor(.white)
                
                
            }
            .padding(16)
            .frame(maxWidth: .infinity, alignment: .topLeading)
            .background(surfaceColor)
            .cornerRadius(16)
            .overlay(
                RoundedRectangle(cornerRadius: 16)
                    .inset(by: 0.5)
                    .stroke(surfaceColor, lineWidth: 1)
            )
        }
        .padding(.horizontal, 20)
        .padding(.top, 64)
        .padding(.bottom, 24)
        .frame(maxWidth: .infinity)
        .frame(alignment: .top)
        .background(bgColor)
    }
}


// MARK: - CardView (Consult card)
private struct CardView: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            // Title
            Text("Doctor Consult")
                .font(.system(size: 16, weight: .semibold))
                .foregroundColor(Color(red: 0.35, green: 0.35, blue: 0.35))
                .frame(maxWidth: .infinity, alignment: .topLeading)
            
            HStack(alignment: .center, spacing: 12) {
                // Doctor avatar
                HStack(alignment: .center, spacing: 0) {
                    // Avatar content placeholder
                }
                .padding(0)
                .frame(width: 36, height: 36, alignment: .center)
                .background(Color(red: 0.9, green: 0.94, blue: 0.93))
                .cornerRadius(8)
                
                VStack(alignment: .leading, spacing: 4) {
                    // Doctor name
                    Text("Dr. Niyati Sharma")
                        .font(.system(size: 12, weight: .medium))
                        .foregroundColor(Color(red: 0.35, green: 0.35, blue: 0.35))
                        .frame(maxWidth: .infinity, alignment: .topLeading)
                    
                    // Specialization
                    Text("General Physician")
                        .font(.system(size: 12))
                        .foregroundColor(Color(red: 0.35, green: 0.35, blue: 0.35))
                        .frame(maxWidth: .infinity, alignment: .topLeading)
                }
                
                Spacer()
            }
            
            // Appointment details row
            HStack(spacing: 16) {
                HStack(spacing: 4) {
                    Image(systemName: "clock")
                        .font(.system(size: 12))
                        .foregroundColor(Color(red: 0.35, green: 0.35, blue: 0.35))
                    
                    Text("7:30 PM")
                        .font(.system(size: 12))
                        .foregroundColor(Color(red: 0.35, green: 0.35, blue: 0.35))
                }
                
                HStack(spacing: 4) {
                    Image(systemName: "person")
                        .font(.system(size: 12))
                        .foregroundColor(Color(red: 0.35, green: 0.35, blue: 0.35))
                    
                    Text("Shivani")
                        .font(.system(size: 12))
                        .foregroundColor(Color(red: 0.35, green: 0.35, blue: 0.35))
                }
                
                Spacer()
            }
        }
        .padding(20)
        .background(.white)
        .cornerRadius(16)
    }
}

// MARK: - OfferingsView
private struct OfferingsView: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            Rectangle()
                .fill(Color(uiColor: .systemGray4))
                .cornerRadius(8)
                .frame(width: 80 ,height: 20)
                .padding(.horizontal, 20)
                .padding(.top, 20)

            LazyVGrid(columns: [GridItem(.flexible(), spacing: 16), GridItem(.flexible())], spacing: 16) {
                ForEach(0..<6) { idx in
                    OfferingCardView(index: idx)
                }
            }
            .padding(.horizontal, 20)
            .padding(.vertical, 16)
            .frame(width: 393, alignment: .topLeading)
        }
    }
}

private struct OfferingCardView: View {
    let index: Int
    var body: some View {
        VStack(alignment: .leading, spacing: 7.13318) {
            VStack(alignment: .leading, spacing: 17.83296) {
                // Top icon
                ZStack {
                    // Icon content placeholder
                }
                .frame(width: 32.09932, height: 32.09932)
                .background(Color(red: 0.95, green: 0.95, blue: 0.96))
                .cornerRadius(40)
                
                // Text content
                VStack(alignment: .leading, spacing: 8) {
                    Rectangle()
                        .foregroundColor(.clear)
                        .frame(width: 44, height: 12)
                        .background(Color(red: 0.24, green: 0.29, blue: 0.35))
                        .cornerRadius(4)

                    Rectangle()
                        .foregroundColor(.clear)
                        .frame(width: 84, height: 12)
                        .background(Color(red: 0.24, green: 0.29, blue: 0.35))
                        .cornerRadius(4)

                    Rectangle()
                        .foregroundColor(.clear)
                        .frame(width: 54, height: 8)
                        .background(Color(red: 0.95, green: 0.95, blue: 0.96))
                        .cornerRadius(4)

                    Rectangle()
                        .foregroundColor(.clear)
                        .frame(width: 92, height: 8)
                        .background(Color(red: 0.95, green: 0.95, blue: 0.96))
                        .cornerRadius(4)

                    Rectangle()
                        .foregroundColor(.clear)
                        .frame(width: 42, height: 8)
                        .background(Color(red: 0.95, green: 0.95, blue: 0.96))
                        .cornerRadius(4)
                }
                .padding(0)
                .frame(maxWidth: .infinity, alignment: .topLeading)
            }
            .padding(0)
            .frame(maxWidth: .infinity, alignment: .topLeading)
        }
        .padding(14.26637)
        .frame(maxWidth: .infinity, alignment: .topLeading)
        .background(.white)
        .cornerRadius(10.69977)
    }
}

// MARK: - BottomStickyCardView
private struct BottomStickyCardView: View {
    var onChevronTap: () -> Void

    var body: some View {
        HStack(spacing: 12) {
            VStack(alignment: .leading, spacing: 4) {
                // Text Extra Small/Regular
                Text("Consult with Dr. Niyati Sharma")
                    .font(.system(size: 12))
                    .foregroundColor(Color(red: 0.35, green: 0.35, blue: 0.35))
                    .frame(maxWidth: .infinity, alignment: .topLeading)

                // Text Small/Semibold
                Text("Your prescription is ready")
                    .font(.system(size: 14, weight: .semibold))
                    .foregroundColor(Color(red: 0.35, green: 0.35, blue: 0.35))
                    .frame(maxWidth: .infinity, alignment: .topLeading)
            }

            // Chevron button
            Button(action: onChevronTap) {
                VStack(alignment: .center, spacing: 10) {
                    HStack(alignment: .center, spacing: 4) { 
                        Image(systemName: "chevron.right")
                            .font(.system(size: 12))
                            .foregroundColor(Color(red: 0.35, green: 0.35, blue: 0.35))
                    }
                    .padding(0)
                }
                .padding(.horizontal, 16)
                .padding(.vertical, 8)
                .frame(height: 36, alignment: .center)
                .cornerRadius(8)
                .overlay(
                    RoundedRectangle(cornerRadius: 8)
                        .inset(by: 0.5)
                        .stroke(Color(red: 0.8, green: 0.84, blue: 0.83), lineWidth: 1)
                )
            }
            .buttonStyle(.plain)
        }
        .padding(.horizontal, 20)
        .padding(.vertical, 16)
        .background(Color.white)
        .cornerRadius(14)
        .shadow(color: Color.black.opacity(0.06), radius: 8, x: 0, y: 4)
    }
}

// MARK: - ConsultDetailView (destination)
private struct ConsultDetailView: View {
    @Environment(\.dismiss) private var dismiss

    var body: some View {
        VStack(spacing: 24) {
            HStack {
                Button(action: { dismiss() }) {
                    Image(systemName: "chevron.left")
                        .font(.system(size: 16, weight: .medium))
                        .foregroundColor(.blue)
                        .padding(8)
                }
                .buttonStyle(.plain)

                Spacer()

                Text("Consult Detail")
                    .font(.headline)

                Spacer()

                Color.clear.frame(width: 40, height: 40)
            }
            .padding()

            Spacer()
            Text("This is the full-screen pushed Consult Detail view.")
                .multilineTextAlignment(.center)
                .padding()
            Spacer()
        }
        .background(Color(uiColor: .systemBackground))
        .navigationBarHidden(true)
    }
}

// MARK: - Previews
#Preview {
    InteractiveGrayDemoView()
}
