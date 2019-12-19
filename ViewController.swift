//
//  ViewController.swift
//  UICollectionViewDemo
//
//  Created by MINI01 ACCELERON on 12/12/19.
//  Copyright © 2019 MINI01 ACCELERON. All rights reserved.
//

import UIKit

struct Logo {
    var imageName: String?
    var text: String?
    var ImageLink: String?
}
class ViewController: UIViewController {

    @IBOutlet var logoCollectionView: UICollectionView!
    var logoCollectionViewFlowLayout: UICollectionViewFlowLayout!
    var logos: [Logo] = []
    var fullList: [Logo] = []
    var currentPointer: Int = 0
    var nextTimer: Timer?

    override func viewDidLoad() {
        super.viewDidLoad()
        print("did load")
        // Do any additional setup after loading the view.
        loadData()
        setupCollectionView()
    }
    
    @IBAction func nextMessageButton() {
        self.loadNextMessage()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        //print("bottom - \(UIApplication.shared.keyWindow?.safeAreaInsets.bottom)")
        findDimensionsOfCollectionViewCell()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        print("did appear")
        super.viewDidAppear(true)
        //self.nextTimer = Timer.scheduledTimer(timeInterval: 0.8, target: self, selector: #selector(self.loadNextMessage), userInfo: nil, repeats: true)

    }
    
    @objc private func loadNextMessage() {
        if self.currentPointer < fullList.count {
            //self.logos.insert(self.fullList[self.currentPointer], at: 0)
            self.logos.append(self.fullList[self.currentPointer])
            self.currentPointer += 1
            self.logoCollectionView.reloadData()
            //            print("Top-- \(self.logoCollectionView.contentInset.top)")
            //            print("Bottom-- \(self.logoCollectionView.contentInset.bottom)")
            //            print("content size height -- \(self.logoCollectionView.contentSize.height)")
            //            print("frame size height -- \(self.logoCollectionView.frame.size.height)")
        } else {
            self.nextTimer?.invalidate()
        }
        let contentHeight: CGFloat = self.logoCollectionView.contentSize.height
        let heightAfterInserts: CGFloat = self.logoCollectionView.frame.size.height - (self.logoCollectionView.contentInset.top + self.logoCollectionView.contentInset.bottom)
        //self.logoCollectionView.setContentOffset(CGPoint(x: 0, y: self.logoCollectionView.contentSize.height), animated: true)
        self.logoCollectionView.scrollToItem(at: IndexPath.init(row: self.currentPointer - 1, section: 0), at: .bottom, animated: true)
//        if contentHeight > heightAfterInserts {
//            self.logoCollectionView.setContentOffset(CGPoint(x: 0, y: self.logoCollectionView.contentSize.height - self.logoCollectionView.frame.size.height), animated: true)
//        }
        //        if contentHeight < heightAfterInserts {
        //            self.logoCollectionView.setContentOffset(CGPoint(x: 0, y: -1 * ceil(self.logoCollectionView.contentSize.height)), animated: true)
        //        }
        //print("curretn state - \(self.currentPointer) and list count - \(self.fullList.count)")
    }
    
    //    override func viewWillLayoutSubviews() {
    //        print("slowww")
    //        super.viewWillLayoutSubviews()
    //        findDimensionsOfCollectionViewCell()
    //    }
    
    private func findDimensionsOfCollectionViewCell() {
        if logoCollectionViewFlowLayout == nil {
            let cellsPerRow: CGFloat = 1
            let cellWidth = (self.logoCollectionView.frame.width - (cellsPerRow + 1) * 10.0) / cellsPerRow
            let cellHeight = cellWidth
            logoCollectionViewFlowLayout = UICollectionViewFlowLayout()
            //logoCollectionViewFlowLayout.itemSize = CGSize.init(width: cellWidth, height: cellHeight)
            //logoCollectionViewFlowLayout.itemSize = CGSize.init(width: self.logoCollectionView.frame.width, height: 100)
            logoCollectionViewFlowLayout.sectionInset = UIEdgeInsets.zero
            logoCollectionViewFlowLayout.scrollDirection = .vertical
            logoCollectionViewFlowLayout.minimumLineSpacing = 10.0
            logoCollectionViewFlowLayout.minimumInteritemSpacing = 10.0
            logoCollectionView.setCollectionViewLayout(logoCollectionViewFlowLayout, animated: true)
            logoCollectionView.isPagingEnabled = false
            
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let logoObject = sender as! Logo
        if segue.identifier == "viewLargeImageSegueId" {
            if let vc = segue.destination as? LogoViewContoller {
                vc.imageName = logoObject.imageName
            }
        }
    }
    
    private func loadData() {
        fullList = [Logo(imageName: "logo1", text: "Hey, have you heard about Texties?", ImageLink: nil),
                 Logo(imageName: "logo2", text: nil, ImageLink: nil),
                Logo(imageName: nil, text: "It\'s great! Totally new way of telling a story.", ImageLink: nil),
                Logo(imageName: "logo4",text: nil, ImageLink: nil),
                Logo(imageName: "logo5",text: "It\'s great! Totally new way of telling a story.", ImageLink: nil),
                Logo(imageName: nil,text: "1k2jh3khhsdf", ImageLink: nil),
                Logo(imageName: "logo7",text: "jhakshdjkhsad", ImageLink: nil),
                Logo(imageName: "logo8",text: "hhhdnnasd", ImageLink: nil),
                Logo(imageName: "logo9",text: "bamsdjaksjdj" ,ImageLink: nil),
                Logo(imageName: nil,text: "jkahskjdhkjahsdkjh", ImageLink: nil),
                Logo(imageName: "logo11",text: nil, ImageLink: nil),
                Logo(imageName: "logo12",text: nil, ImageLink: nil),
                Logo(imageName: nil, text: "asgdhjg", ImageLink: nil),
                Logo(imageName: "logo14",text: "ajshdkjhjkh", ImageLink: nil),
                Logo(imageName: nil, text: "asdbj", ImageLink: nil),
                Logo(imageName: nil,text: "hkhasd", ImageLink: nil),
                Logo(imageName: nil,text: "kahskjhkjs", ImageLink: nil),
                Logo(imageName: "logo18",text: "This? This is the story?" , ImageLink: nil),
                Logo(imageName: "logo19",text: nil, ImageLink: nil),
                Logo(imageName: "logo20",text: nil, ImageLink: nil),
                Logo(imageName: "logo21", text: "h r u?", ImageLink: nil),
                Logo(imageName: "logo22",text: "bbm", ImageLink: nil),
                Logo(imageName: nil, text: "sup?", ImageLink: nil),
                Logo(imageName: "logo24",text: nil, ImageLink: nil),
                Logo(imageName: "logo25",text: "alamofire", ImageLink: nil),
                Logo(imageName: "logo26",text: "kingfisher", ImageLink: nil),
                Logo(imageName: nil, text: "tabman", ImageLink: nil),
                Logo(imageName: "logo28",text: "texties", ImageLink: nil),
                Logo(imageName: "logo29",text: "whatsapp", ImageLink: nil),
                Logo(imageName: "logo30",text: nil, ImageLink: nil),
                Logo(imageName: "logo31",text: "twitter", ImageLink: nil),
                Logo(imageName: "logo32",text: nil, ImageLink: nil),
                Logo(imageName: nil, text: "fb", ImageLink: nil),
                Logo(imageName: "logo34",text: "dhkjhajsh", ImageLink: nil),
                Logo(imageName: nil,text: "That\'s perfect, I love it", ImageLink: nil),
                Logo(imageName: "logo36",text: nil, ImageLink: nil),
                Logo(imageName: nil, text: "gd", ImageLink: nil),
                Logo(imageName: "logo38", text: "sees", ImageLink: nil),
                Logo(imageName: nil, text: "u",ImageLink: nil),
                Logo(imageName: nil, text: "no one can save you now",ImageLink: nil)]
        }
    
    private func setupCollectionView() {
        self.logoCollectionView.register(myLogoCell.self, forCellWithReuseIdentifier: "myLogoCell")
        //register(UINib.init(nibName: "logoCell", bundle: Bundle.main), forCellWithReuseIdentifier: "logoCell")
        self.logoCollectionView.delegate = self
        self.logoCollectionView.dataSource = self
        self.logoCollectionView.backgroundColor = #colorLiteral(red: 0.9137254902, green: 0.6901960784, blue: 0.07450980392, alpha: 1)
        //self.logoCollectionView.transform = CGAffineTransform (scaleX: 1, y: -1)
    }
}

// MARK: UI Collection view
extension ViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
        
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.logos.count
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let alert = UIAlertController(title: nil, message: "Touched image - \(logos[indexPath.item].imageName == nil ? "nope": logos[indexPath.item].imageName!)", preferredStyle: .alert)
        self.present(alert, animated: true, completion: nil)
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now()+1.5, execute: {
            alert.dismiss(animated: true, completion: nil)
        })
        //performSegue(withIdentifier: "viewLargeImageSegueId", sender: logos[indexPath.item])
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        //print("iindex path -- \(indexPath)")
        if logos[indexPath.item].text == nil && logos[indexPath.item].imageName == nil {
            return CGSize.init(width: 0, height: 0)
        }
        else if logos[indexPath.item].text == nil && logos[indexPath.item].imageName != nil {
            let image = UIImage.init(named: logos[indexPath.item].imageName!)
            return CGSize.init(width: collectionView.frame.width, height: (image!.size.height * (collectionView.frame.width - 20.0) / image!.size.width) + 30)
        }
        else if logos[indexPath.item].imageName == nil && logos[indexPath.item].text != nil {
            return CGSize.init(width: collectionView.frame.width, height: logos[indexPath.item].text!.height(withConstrainedWidth: collectionView.frame.width, font: UIFont.init(name: "Menlo", size: 15.0)!) + 30)
        }
        else {
            let image = UIImage.init(named: logos[indexPath.item].imageName!)

            let totalHeight = (image!.size.height * ((collectionView.frame.width - 20.0) / image!.size.width)) + (logos[indexPath.item].text!.height(withConstrainedWidth: collectionView.frame.width, font: UIFont.init(name: "Menlo", size: 15.0)!)) + 60

            return CGSize.init(width:collectionView.frame.width, height: totalHeight)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let nCell = collectionView.dequeueReusableCell(withReuseIdentifier: "myLogoCell", for: indexPath) as! myLogoCell
        nCell.bind(logoObject: logos[indexPath.item])
        return nCell
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "logoCell", for: indexPath) as! logoCell
        cell.bind(logoObject: logos[indexPath.item], index: indexPath.item, nextDo: {
            //collectionView.reloadItems(at: [indexPath])
        })
        return cell
    }
}

class myLogoCell: UICollectionViewCell {
    
    func bind(logoObject: Logo) {
        if logoObject.imageName == nil && logoObject.text == nil { return }
        
        else if logoObject.imageName == nil && logoObject.text != nil {
            self.imgView.isHidden = true
            self.imageNameLabel.isHidden = false
            self.imageNameLabel.text = "\(logoObject.text!)"
            // set heights
//            self.imgView.frame(forAlignmentRect: CGRect.zero)
//            //CGSize.init(width: collectionView.frame.width, height: logos[indexPath.item].text!.height(withConstrainedWidth: collectionView.frame.width, font: UIFont.init(name: "Menlo", size: 15.0)!) + 30)
//            self.imageNameLabel.frame(forAlignmentRect: CGRect.init(x: 10, y: 10, width: UIScreen.main.bounds.width - 40.0,
//            height: logoObject.text!.height(withConstrainedWidth:  UIScreen.main.bounds.width, font: UIFont.init(name: "Menlo", size: 15.0)!) + 30) )
            
        }
        else if logoObject.imageName != nil && logoObject.text == nil {
            self.imgView.isHidden = false
            self.imageNameLabel.isHidden = true
            self.imgView.image = UIImage(named: logoObject.imageName!)
            // set heights
//            self.imageNameLabel.frame(forAlignmentRect: CGRect.zero)
//            let image = UIImage.init(named: logoObject.imageName!)
//            self.imgView.frame(forAlignmentRect: CGRect.init(x: 10, y: 10, width: UIScreen.main.bounds.width, height: (image!.size.height * (UIScreen.main.bounds.width - 20.0) / image!.size.width) + 30))
    
        }
        else {
            self.imgView.isHidden = false
            self.imageNameLabel.isHidden = false
            self.imageNameLabel.text = "\(logoObject.text!)"
            self.imgView.image = UIImage(named: logoObject.imageName!)
//
//            let image = UIImage.init(named: logoObject.imageName!)
//            self.imgView.frame(forAlignmentRect: CGRect.init(x: 10, y: 10, width: UIScreen.main.bounds.width, height: (image!.size.height * (UIScreen.main.bounds.width - 20.0) / image!.size.width) + 30))
//
//            self.imageNameLabel.frame(forAlignmentRect: CGRect.init(x: 10, y: 10 + self.imgView.frame.height, width: UIScreen.main.bounds.width - 40.0,
//                       height: logoObject.text!.height(withConstrainedWidth:  UIScreen.main.bounds.width, font: UIFont.init(name: "Menlo", size: 15.0)!) + 30) )
        }
        self.layoutIfNeeded()
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        self.imgView.image = nil
        self.imageNameLabel.text = nil
        self.imageNameLabel.isHidden = false
        self.imgView.isHidden = false
    }
    
    override init(frame: CGRect) {
        super.init(frame: CGRect.zero)
        self.backgroundColor = #colorLiteral(red: 0.8078431487, green: 0.02745098062, blue: 0.3333333433, alpha: 1)
        
        contentView.addSubview(imgView)
        contentView.addSubview(imageNameLabel)
        
        
        //contentView.inset = UIEdgeInsets.init(top: 10.0, left: 0, bottom: 10, right: 0)
        
        
        imgView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10.0).isActive = true
        //imgView.bottomAnchor.constraint(equalTo: imageNameLabel.topAnchor, constant: -10.0).isActive = true
        
        imgView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10.0).isActive = true
        imgView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10.0).isActive = true

        imageNameLabel.topAnchor.constraint(equalTo: imgView.bottomAnchor, constant: 10.0).isActive = true
        imageNameLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10.0).isActive = true
        
        imageNameLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10.0).isActive = true
        imageNameLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10.0).isActive = true
    }
    
    let imageNameLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.init(name: "Menlo", size: 15.0)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.backgroundColor = #colorLiteral(red: 0.1960784346, green: 0.3411764801, blue: 0.1019607857, alpha: 1)
        label.textColor = #colorLiteral(red: 0.9686274529, green: 0.78039217, blue: 0.3450980484, alpha: 1)
        return label
    }()
    
    let imgView: UIImageView = {
        let img_V = UIImageView()
        img_V.translatesAutoresizingMaskIntoConstraints = false
        img_V.contentMode = .scaleAspectFit
        img_V.layer.cornerRadius = 20
        img_V.backgroundColor = #colorLiteral(red: 1, green: 0.4296739988, blue: 0.1075411826, alpha: 1)
        img_V.clipsToBounds = true
        return img_V
    }()
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}


extension String {
    func height(withConstrainedWidth width: CGFloat, font: UIFont) -> CGFloat {
        let constraintRect = CGSize(width: width, height: .greatestFiniteMagnitude)
        let boundingBox = self.boundingRect(with: constraintRect, options: .usesLineFragmentOrigin, attributes: [.font: font], context: nil)

        return ceil(boundingBox.height)
    }

    func width(withConstrainedHeight height: CGFloat, font: UIFont) -> CGFloat {
        let constraintRect = CGSize(width: .greatestFiniteMagnitude, height: height)
        let boundingBox = self.boundingRect(with: constraintRect, options: .usesLineFragmentOrigin, attributes: [.font: font], context: nil)

        return ceil(boundingBox.width)
    }
}
