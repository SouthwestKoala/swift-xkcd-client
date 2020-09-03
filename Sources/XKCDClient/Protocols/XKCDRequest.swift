import Foundation
import RESTClient

protocol XKCDRequest: Request {    
}

extension XKCDRequest {
    var baseURL: URL { XKCD.baseURL }    
}