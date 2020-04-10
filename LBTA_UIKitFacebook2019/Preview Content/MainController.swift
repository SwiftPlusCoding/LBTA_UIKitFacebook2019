//
//  MainController.swift
//  FB2019
//
//  Created by Mykola Matsko on 09.04.2020.
//  Copyright © 2020 Mykola Matsko. All rights reserved.
//

import UIKit
import SwiftUI
import LBTATools

class PostCell: LBTAListCell<String> {
    
    let imageView = UIImageView(backgroundColor: .red)
    let nameLabel = UILabel(text: "Name label")
    let dateLabel = UILabel(text: "Friday at 11:00AM")
    let postTextLabel = UILabel(text: "Here is my post text")
    
//    let imageViewGrid = UIView(backgroundColor: .yellow)
    let photosGridController = PhotosGridController()
    
    override func setupViews() {
        backgroundColor = .white
        
        stack(hstack(imageView.withHeight(40).withWidth(40),
                     stack(nameLabel, dateLabel),
            spacing: 8).padLeft(12).padRight(12).padTop(12),
              postTextLabel, photosGridController.view, spacing: 8)
    }
}

class MainController: LBTAListController<PostCell, String>, UICollectionViewDelegateFlowLayout {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.backgroundColor = .init(white: 0.9, alpha: 1)
        
        self.items = ["hello", "WORLD", "1", "2"]
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return .init(width: view.frame.width, height: 420)
    }
}

struct MainPreview: PreviewProvider {
    static var previews: some View {
//        Text("Main preview")
        ContainerView().edgesIgnoringSafeArea(.all)
    }
    
    struct ContainerView: UIViewControllerRepresentable {
        
        func makeUIViewController(context: Context) -> UIViewController {
            return MainController()
        }
        
        func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {
            
        }
    }
}
