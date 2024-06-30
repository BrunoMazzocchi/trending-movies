import Foundation

enum NetworkError: Error {
    case urlError
    case canNotParseData
    case serverError(Error)
}

class APICaller {
    /// Caller function to get trending movies with an async function
    static func getTrendingMovies(completionHandler: @escaping (_ result: Result<TrendingMoviesModel, Error>) -> Void) {
        let urlString = NetworkConstant.shared.serverAddress + NetworkConstant.shared.trending
        
        guard let url = URL(string: urlString) else {
            // If can't convert to url
            completionHandler(.failure(NetworkError.urlError))
            return
        }
        
        // Calling the endpoint. URLSession is the default package, there are 3rd parties tho.
        URLSession.shared.dataTask(with: url) { dataResponse, urlResponse, error in
            if let error = error {
                // Handle network error
                completionHandler(.failure(NetworkError.serverError(error)))
                return
            }
            
            guard let data = dataResponse else {
                // Handle no data error
                completionHandler(.failure(NetworkError.canNotParseData))
                return
            }
            
            do {
                // Attempt to decode data
                let resultData = try JSONDecoder().decode(TrendingMoviesModel.self, from: data)
                completionHandler(.success(resultData))
            } catch {
                // Handle decoding error
                completionHandler(.failure(NetworkError.canNotParseData))
            }
        }.resume()
    }
}
