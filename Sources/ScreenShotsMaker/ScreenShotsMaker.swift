//
//  ScreenshotWithTitle.swift
//  ScreenShotsMaker
//
//  Created by Cedric Pugnaire on 11/04/2023.
//

import SwiftUI

public struct ScreenShotsMaker: View, CapturingView {
    public let title: String
    public let image: Image
    public let imagePadding: Double
    public let background: ImageBackground
    public let exportSize: ExportSize
    public let alignment: TitleAlignment
    public let font: Font
    public let foregroundColor: Color
    
    public init(
        title: String,
        image: Image,
        imagePadding: Double,
        background: ImageBackground,
        exportSize: ExportSize,
        alignment: TitleAlignment = .titleAbove,
        font: Font = .system(size: 50, weight: .regular, design: .rounded),
        foregroundColor: Color = .primary
    ) {
        self.title = title
        self.image = image
        self.imagePadding = imagePadding
        self.background = background
        self.exportSize = exportSize
        self.alignment = alignment
        self.font = font
        self.foregroundColor = foregroundColor
    }
    
    public var body: some View {
        ZStack {
            switch background {
            case .color(let color):
                color
            case .gradient(let linearGradient):
                linearGradient
            case .image(let image):
                image
                    .resizable()
                    .scaledToFill()
                    .frame(width: exportSize.size.width, height: exportSize.size.height)
                    .clipped()
            }
            
            VStack {
                if case .titleAbove = alignment {
                    Text(title)
                        .font(font)
                        .padding(.top)
                        .foregroundColor(foregroundColor)
                    
                    Spacer()
                }
                
                image
                    .resizable()
                    .cornerRadius(exportSize.cornerRadius)
                    .scaledToFit()
                    .padding(imagePadding)
                
                if case .titleBelow = alignment {
                    Spacer()
                    
                    Text(title)
                        .font(font)
                        .padding(.bottom)
                        .foregroundColor(foregroundColor)
                }
            }
            .padding()
        }
        .frame(width: exportSize.size.width, height: exportSize.size.height)
    }
}
