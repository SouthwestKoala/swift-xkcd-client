import Foundation
import RESTClient

struct CurrentComicRequest: XKCDRequest {
    typealias Response = Comic

    var resourcePath: String { "info.0.json" }        
}
