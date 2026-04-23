//
//  AppStateManager.swift
//  Friensy
//
//  Created by Katherine Pizzirusso on 4/22/26.
//

import Foundation
import SwiftUI
import Combine

class AppStateManager: ObservableObject {
    @Published var state = AppState()
}
