//
//  ImageDownloader.swift
//  TGY2024-VIPER
//
//  Created by Kerim Çağlar on 18.05.2024.
//

import Foundation

enum ImageDownloaderError: Error {
    case badResponse(URLResponse?)
    case badData
    case badLocalUrl
}

final class ImageDownloader {
    
    static var shared = ImageDownloader()
    private var images = NSCache<NSString, NSData>()
    
    let session: URLSession
    
    init() {
        let config = URLSessionConfiguration.default
        session = URLSession(configuration: config)
    }
    
    private func download(imageURL: URL, completion: @escaping (Data?, Error?) -> Void) {
        if let imageData = images.object(forKey: imageURL.absoluteString as NSString) {
            completion(imageData as Data, nil)
            return
        }
        
        let task = session.downloadTask(with: imageURL) { localUrl, response, error in
            if let error {
                completion(nil, error)
                return
            }
            
            guard let httpResponse = response as? HTTPURLResponse, (200...299).contains(httpResponse.statusCode) else {
                completion(nil, ImageDownloaderError.badResponse(response))
                return
            }
            
            guard let localUrl else {
                completion(nil, ImageDownloaderError.badLocalUrl)
                return
            }
            
            do {
                let data = try Data(contentsOf: localUrl)
                self.images.setObject(data as NSData, forKey: imageURL.absoluteString as NSString)
                completion(data, nil)
            } catch {
                completion(nil, error)
            }
        }
        
        task.resume()
    }
    
    func image(news: News, format: Format, completion: @escaping (Data?, Error?) -> Void) {
        if let multimedia = news.multimedia?.filter({  $0.format == format }).first {
            guard let url = URL(string: multimedia.url ?? "") else { return }
            download(imageURL: url, completion: completion)
        }
    }
}
