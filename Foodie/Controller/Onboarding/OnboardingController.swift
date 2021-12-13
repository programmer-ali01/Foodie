//
//  ViewController.swift
//  Foodie
//
//  Created by Alisena Mudaber on 9/13/21.
//

import UIKit



class OnboardingController: UIViewController {
    
    
    let slides: [
        OnboardingSlide] = [
            OnboardingSlide(title: "Delicious dishes", description: "Experience a variety of delicious meals and cuisines from all around the world", image: #imageLiteral(resourceName: "hamburger3")),
            OnboardingSlide(title: "", description: "", image: #imageLiteral(resourceName: "burger")),
            OnboardingSlide(title: "", description: "", image: #imageLiteral(resourceName: "burger4"))
    ]
   

    private let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
       // layout.itemSize = CGSize(width: 300, height: 500)
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
      //  collectionView.isPagingEnabled = true
        collectionView.register(OnboardingCell.self, forCellWithReuseIdentifier: OnboardingCell.reuseIdentifier)
        return collectionView
    }()
    
  
    
    let pageControl : UIPageControl = UIPageControl(frame: CGRect(x: 50, y: 300, width: 200, height: 20))
    
    var currentPage = 0 {
        didSet {
            pageControl.currentPage = currentPage
            if currentPage == slides.count - 1 {
                nextButton.setTitle("Get Started", for: .normal)
           
            } else {
                nextButton.setTitle("Next", for: .normal)
              
            }
        }
    }
    
    let nextButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .darkGray
        button.setTitle("Next", for: .normal)
        button.accessibilityIdentifier = "nextButton"
        button.titleLabel?.adjustsFontSizeToFitWidth = true
        button.setDimensions(width: 120, height: 45)
        button.addTarget(self, action: #selector(nextButtonPressed), for: .touchUpInside)
        button.layer.cornerRadius = 12
        //button.accessibilityIdentifier = "nextButton"
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
     
       
        
        configureUI()
        
    
        
        collectionViewSetup()
        configurePageControl()
        view.backgroundColor = .systemBackground
        
        
    }
    
    func configurePageControl() {
        pageControl.numberOfPages = slides.count
       // pageControl.currentPage = 0
        pageControl.tintColor = UIColor.red
        pageControl.pageIndicatorTintColor = UIColor.black
        pageControl.currentPageIndicatorTintColor = UIColor.yellow
        pageControl.isUserInteractionEnabled = false
        
        view.addSubview(pageControl)
        pageControl.centerX(inView: view.self)
        pageControl.anchor(bottom: nextButton.topAnchor, paddingBottom: 10)
        
     }
    
    func collectionViewSetup() {
        view.addSubview(collectionView)
        collectionView.delegate = self
        collectionView.dataSource = self
        
     //   collectionView.anchor(top: view.safeAreaLayoutGuide.topAnchor)
    
        
    }
    
    func configureUI() {
        view.addSubview(nextButton)
      
        nextButton.anchor(bottom: view.safeAreaLayoutGuide.bottomAnchor, paddingBottom: 30)
        nextButton.centerX(inView: view.self)
        
      
        
    }
    
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        collectionView.setDimensions(width: view.frame.width, height: view.frame.height / 1.25)
        collectionView.backgroundColor = .lightGray
    }
    
    @objc func nextButtonPressed() {
        if currentPage == slides.count - 1 {
            let layout = UICollectionViewFlowLayout()
            let homeViewController = UINavigationController(rootViewController: HomeViewController(collectionViewLayout: layout))
            
            homeViewController.modalPresentationStyle = .fullScreen
            homeViewController.modalTransitionStyle = .coverVertical
            UserDefaults.standard.hasOnboarded = true
            present(homeViewController, animated: true, completion: nil)
            
     //       navigationController?.pushViewController(homeViewController, animated: true)
            
        } else {
            currentPage += 1
            let indexPath = IndexPath(item: currentPage, section: 0)
            collectionView.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
        }
  
    }

}


extension OnboardingController: UIScrollViewDelegate {
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
       //scrollView.delegate = self
       // scrollView.isUserInteractionEnabled = false
        
       currentPage = Int(scrollView.contentOffset.x / scrollView.frame.size.width)
        
   }
}


extension OnboardingController: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return slides.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: OnboardingCell.reuseIdentifier, for: indexPath) as? OnboardingCell else { return OnboardingCell() }
        cell.setup(slides[indexPath.row])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: collectionView.frame.height)
    }
    
    
}
