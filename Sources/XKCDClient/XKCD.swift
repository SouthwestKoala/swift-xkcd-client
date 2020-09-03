import Foundation
import FoundationNetworking
import RESTClient
import OpenCombine

struct XKCD {
    static var baseURL: URL {
        guard let url = URL(string: "https://xkcd.com/") else {
            preconditionFailure("Invalid URL")
        }

        return url
    }

    func getComic(number: Int) -> AnyPublisher<Comic, TransportError> {
        URLSession.shared
            .send(ComicRequest(num: number))
            .eraseToAnyPublisher()
    } 

    func getCurrentComic() -> AnyPublisher<Comic, TransportError> {
        URLSession.shared
            .send(CurrentComicRequest())
            .eraseToAnyPublisher()
    }
}
