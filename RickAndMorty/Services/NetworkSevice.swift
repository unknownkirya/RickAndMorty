//
//  NetworkSevice.swift
//  RickAndMorty
//
//  Created by Кирилл Бережной on 19.10.2023.
//

import Foundation
import Alamofire

final class NetworkService {
    
    private let url = "https://rickandmortyapi.com/api/character"
    var characterList = [Character.Result]()
    var episode = Episode()
    
    func fetchCharacter(completion: @escaping ([Character.Result]) -> ()) {
        AF.request(url, method: .get).responseDecodable(of: CharacterResponse.self) { response in
            switch response.result {
            case .success(let characterResponse):
                let characters = characterResponse.results
                DispatchQueue.main.async {
                    completion(characters)
                }
            case .failure(let error):
                print("Ошибка при запросе данных: \(error)")
                return
            }
        }
    }
    
    func fetchImage(url: String) -> UIImage {
        if let imageUrl = URL(string: url) {
            let semaphore = DispatchSemaphore(value: 0)
            var image: UIImage?
            URLSession.shared.dataTask(with: imageUrl) { data, response, error in
                defer {
                    semaphore.signal()
                }
                if let error = error {
                    print("Ошибка при загрузке изображения: \(error)")
                    return
                }
                if let data = data {
                    image = UIImage(data: data)
                }
            }.resume()
            semaphore.wait()
            return image ?? UIImage()
        }
        return UIImage()
    }
    
    func fetchEpisode(url: String, completion: @escaping (Episode) -> ()) {
        AF.request(url, method: .get).responseDecodable(of: Episode.self) { response in
            switch response.result {
            case .success(let episode):
                let episode = episode
                completion(episode)
//                print(episode)
//                DispatchQueue.main.async {
//                    completion(episode)
//                }
            case .failure(let error):
                print("Ошибка при запросе данных: \(error)")
                return
            }
        }
    }
}
