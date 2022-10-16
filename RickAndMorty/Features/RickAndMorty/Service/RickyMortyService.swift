//
//  RickyMortyService.swift
//  RickAndMorty
//
//  Created by Talha on 16.10.2022.
//

import Alamofire

enum RickyMortyServiceEndPoint: String {
    case Base_URL = "https://rickandmortyapi.com/api"
    case PATH = "/character"
    
    static func characterPath() -> String {
        return "\(Base_URL.rawValue)\(PATH.rawValue)"
    }
}
protocol IRickyMortyService {
    func fetchAllDatas(response: @escaping ([Result]?) -> Void)
}
struct RickyMortyService: IRickyMortyService {
    func fetchAllDatas(response: @escaping ([Result]?) -> Void) {
        AF.request(RickyMortyServiceEndPoint.characterPath()).responseDecodable(of: PostModel.self) { (model) in
            guard let data = model.value else {
                response(nil)
                return
            }
            response(data.results)
        }
    }
    
    
}
