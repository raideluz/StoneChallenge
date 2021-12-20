import UIKit

// MARK: - Class

class HomeViewController: GenericsViewController<HomeView> {
    
    var viewModel: HomeViewModel?
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Personagens"
        contentView.setup(dataSource: self, delegate: self)
        viewModel?.getCharacters()
    }
}

// MARK: - CollectionView Handler

extension HomeViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        viewModel?.numberOfItems ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        // dequeue the standard cell
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! CharactersHomeCells
        
        cell.contentView.backgroundColor = .systemPink
        return cell
    }
}

extension HomeViewController: UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let viewController = DetailsViewController()
        navigationController?.pushViewController(viewController, animated: true)
    }
}
