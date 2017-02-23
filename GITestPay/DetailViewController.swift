//
//  DetailViewController.swift
//  PageViewTut
//
//  Created by kraft on 2/22/17.
//  Copyright © 2017 yesbolapple. All rights reserved.
//
import MapKit
import UIKit

class DetailViewController: UIViewController,MKMapViewDelegate,UIScrollViewDelegate {
    
    @IBOutlet weak var pageControl: UIPageControl!
    
    var rateHolder: Double = 0
    @IBOutlet weak var ratingCosmos: CosmosView!{
        didSet{
            ratingCosmos.rating = rateHolder
        }
    }
    
    @IBOutlet weak var restMap: MKMapView!
    
    
    @IBOutlet weak var scrollGallery: UIScrollView!
    
    
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let offset = scrollGallery.contentOffset.x
        pageControl.currentPage = Int(offset/self.scrollGallery.frame.size.width)
        
        print(offset)
    }
    
    
    
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        scrollGallery.delegate = self
        let images = [UIImage(named:"1"),UIImage(named:"2"),UIImage(named:"3")]
        var frame = CGRect(x: 0, y: 0, width: 0, height: 0)
        
        pageControl.currentPageIndicatorTintColor = UIColor.black
        pageControl.pageIndicatorTintColor = UIColor.gray
        
        self.scrollGallery.isPagingEnabled = true
        
        
        for index in 0..<images.count {
            frame.origin.x = self.scrollGallery.frame.size.width * CGFloat(index)
            frame.size = self.scrollGallery.frame.size
            let sub = UIImageView(frame: frame)
            sub.image = images[index]
            self.scrollGallery.addSubview(sub)
        }
        
        self.scrollGallery.contentSize = CGSize(width: self.scrollGallery.frame.size.width * CGFloat(images.count), height: self.scrollGallery.frame.size.height)
        
        
        
        
        // Map
        let annotationMap = MKPointAnnotation()
        let latitude: CLLocationDegrees = 51.13
        let longitude: CLLocationDegrees = 71.42
        let lanDelta: CLLocationDegrees = 0.01
        let lonDelta: CLLocationDegrees = 0.01
        let span = MKCoordinateSpan(latitudeDelta: lanDelta, longitudeDelta: lonDelta)
        let coordinates = CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
        annotationMap.coordinate = coordinates
        let region = MKCoordinateRegion(center: coordinates, span: span)
        restMap.setRegion(region, animated: true)
        restMap.addAnnotation(annotationMap)
        
    }
    
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toOrder"{
            
            let destVC = segue.destination
            destVC.navigationItem.title = "Order Form"
            
            
        }
    }
    
}






