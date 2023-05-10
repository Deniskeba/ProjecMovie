import UIKit
import SnapKit

class FavoriteViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    let networkService = NetworkService()
    var response: Response? = nil
    var appMovies: [AppMovie] = []
    let mainVC = MainViewController()
   
    
 
    
    let collectionView = UICollectionView(frame: .zero,
                                   collectionViewLayout: UICollectionViewFlowLayout()
    )
    override func viewDidLoad() {
        super.viewDidLoad()
            setupCollectionView()
        
        let url = "https://itunes.apple.com/search?term=movie"
        networkService.request(URL: url) { [self] (result) in
            switch result {
            case .success(let response):
                self.response = response
                guard let results = response.results else {return}
                for item in results {
                    let i = AppMovie(movie: item)
                    appMovies.append(i)
                }
                collectionView.reloadData()
            case .failure(let error):
                print("error", error)
            }
        }

    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        collectionView.frame = view.bounds
        
        
        }
        

    
    

            
           
    func setupCollectionView() {
        collectionView.register(CustomCollectionViewCell.self, forCellWithReuseIdentifier: "identifier")
        collectionView.dataSource = self
        collectionView.delegate = self
        view.addSubview(collectionView)
    
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
            return UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 10    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 1    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.size.width/3 - 4, height: view.frame.size.width/2)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return appMovies.count
    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "identifier", for: indexPath) as! CustomCollectionViewCell
        cell.contentView.layer.cornerRadius = 15
        cell.imageView.downloaded(from: appMovies[indexPath.row].movie.artworkUrl100!)
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let DetailsVC = DetailsViewController()
        self.navigationController?.pushViewController(DetailsVC, animated: true)
        DetailsVC.imageView.downloaded(from: appMovies[indexPath.row].movie.artworkUrl100!)
        DetailsVC.nameLabel.text = appMovies[indexPath.row].movie.trackName
        DetailsVC.producerLabel.text = appMovies[indexPath.row].movie.artistName
        DetailsVC.descritionLabel.text = appMovies[indexPath.row].movie.longDescription
        DetailsVC.genreLabel.text = appMovies[indexPath.row].movie.primaryGenreName?.rawValue
        }
    }




