import Foundation
import RESTClient

struct ComicRequest: XKCDRequest {
    typealias Response = Comic

    let num: Int

    var resourcePath: String { "\(num)/info.0.json" }        
}
