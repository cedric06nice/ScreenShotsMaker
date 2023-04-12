//
//  CapturingView.swift
//  ScreenShotsMaker
//
//  Created by Cedric Pugnaire on 11/04/2023.
//

import SwiftUI

public protocol CapturingView : View {
    var title: String { get }
    var image: Image { get }
    var imagePadding: Double { get }
    var background: ImageBackground { get }
    var exportSize: ExportSize { get }
    var alignment: TitleAlignment { get }
    var font: Font { get }
    var foregroundColor: Color { get }
}
