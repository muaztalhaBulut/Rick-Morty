//
//  RickyMortyViewModel.swift
//  RickAndMorty
//
//  Created by Talha on 16.10.2022.
//

import Foundation

protocol IRickyMortyViewModel {
    func fetchItems()
    func changeLoading()
    
    var rickyMortyCharacters: [Result] {get set}
    var rickyMortyService: IRickyMortyService {get}
    
    var rickyMortyOutPut: RickyMortyOutPut? {get}
    
    func setDelegate(output: RickyMortyOutPut)
}

final class RickyMortyViewModel: IRickyMortyViewModel {
    var rickyMortyOutPut: RickyMortyOutPut?
    
    func setDelegate(output: RickyMortyOutPut) {
        self.rickyMortyOutPut = output
    }
    
    
    var rickyMortyCharacters: [Result] = []
    private var isLoading = false;
    let rickyMortyService: IRickyMortyService
    
    init() {
        rickyMortyService = RickyMortyService()
    }
    func fetchItems() {
        changeLoading()
        rickyMortyService.fetchAllDatas { [weak self] (response) in
            self?.changeLoading()
            self?.rickyMortyCharacters = response ?? []
            self?.rickyMortyOutPut?.saveDatas(values: self?.rickyMortyCharacters ?? [])
        }
    }
    func changeLoading() {
        isLoading = !isLoading
        rickyMortyOutPut?.changeLoading(isLoad: isLoading)
    }
}
