//
//  TagListViewVM.swift
//  Example
//
//  Created by Shorouk Mohamed on 04/12/2021.
//  Copyright © 2021 sha. All rights reserved.
//

import Foundation
import SwiftUI
import Combine

class ChipGroupVM<T: ChipItemProtocol>: ObservableObject {
    @Published var selectedItems: [T] = []
}
