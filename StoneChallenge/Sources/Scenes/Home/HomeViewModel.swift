//
//  HomeViewModel.swift
//  StoneChallenge
//
//  Created by Raileny Santana Lima on 18/12/21.
//

import UIKit
import Kingfisher

// MARK: - Class
 
class HomeViewModel {
    var numberOfItems: Int {
        return characters.count
    }
    
    var network: NetworkManagerProtocol
    weak var viewController: HomeViewController?
    
    private var characters: [CharactersModel] = []
    
    // MARK:  - Initializer
    
    init(network: NetworkManagerProtocol = NetworkManager()) {
        self.network = network
    }
    
    func getCharacters() {
        network.requestCharacters { response in
            switch response {
            case .failure(let error):
                print(error.localizedDescription)
            case .success(let data):
                 if let characters = data.results {
                    self.updatedData(characters: characters)
                }
            }
        }
    }
    
    func updatedData(characters: [CharactersModel]) {
        DispatchQueue.main.async {
            self.characters = characters
            self.viewController?.contentView.collectionView.reloadData()
        }
    }
    
    func getDataForIndex(index: IndexPath) -> CharactersHomeCells.Data? {
        let character = characters[index.row]
        guard let url = URL(string: character.image ?? ""),
              let name = character.name else {
            return nil
        }
        return .init(imageUrl: url, name: name)
    }
    
    func didSelectItemAt(_ index: IndexPath) {
        let character = characters[index.row]
        guard let url = URL(string: character.image ?? "") else {
            return
        }
        let details = DetailsView.Data(name: character.name ?? "",
                                       image: url,
                                       species: character.species ?? "",
                                       gender: character.gender ?? "",
                                       type: character.type ?? "",
                                       status: character.status ?? "")
        let viewModel = DetailsViewModel(details: details)
        
        let viewController = DetailsViewController()
        viewController.viewModel = viewModel
        
        self.viewController?.navigationController?.pushViewController(viewController, animated: true)
    }
}
