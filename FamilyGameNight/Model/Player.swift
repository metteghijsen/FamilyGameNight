import Foundation
import SwiftUI
import CoreLocation

struct Player: Hashable, Codable, Identifiable {
    var id: Int
    var name: String
    var bonus: Bool = false
    var isSelected: Bool = false
}
