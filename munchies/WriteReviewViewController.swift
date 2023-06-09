//
//  WriteReviewViewController.swift
//  munchies
//
//  Created by Janet Olowe on 5/4/23.
//

import UIKit
import AVFoundation
import Foundation

class WriteReviewViewController: UIViewController {
    
    let header = UIImageView()
    let footer = UIImageView()
    let heading = UILabel()
    let backButton = UIButton()
    let submitButton = UIButton()
    let commentLabel = UILabel()
    let commentTextView = UITextView()
    let uploadLabel = UILabel()
    let uploadButton = UIButton()
    let ratingLabel = UILabel()
    let ratingSlider = UISlider()
    let sliderBox = UIImageView()
    let uploadImageView = UIImageView()
    var uploadImage = UIImage(named: "")
    var isImage = false
    
    weak var restaurantsViewController: RestaurantViewController?
    
    weak var delegate: ReloadViewDelegate?
    
    
    let imagePicker = UIImagePickerController()

    let user: User
    
    var restaurant: Restaurant
    
    init(restaurant: Restaurant, user: User, delegate: ReloadViewDelegate) {
        self.delegate = delegate
        self.restaurant = restaurant
        self.user = user
        super.init(nibName: nil, bundle: nil)
    }
    

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.hidesBackButton = true
        view.backgroundColor = UIColor(red: 240/255, green: 137/255, blue: 128/255, alpha: 1)
                
        imagePicker.sourceType = .photoLibrary
        imagePicker.delegate = self

        // Remove UINavBar background color
        let app = UINavigationBarAppearance()
        app.configureWithTransparentBackground()
        self.navigationController?.navigationBar.standardAppearance = app
        self.navigationController?.navigationBar.scrollEdgeAppearance = app
        self.navigationController?.navigationBar.compactAppearance = app

        header.image = UIImage(named: "header4")
        header.translatesAutoresizingMaskIntoConstraints = false
        header.backgroundColor = .clear
        view.addSubview(header)

        footer.image = UIImage(named: "footer")
        footer.backgroundColor = .clear
        footer.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(footer)
        
        heading.textColor = UIColor(red: 1, green: 0.988, blue: 0.883, alpha: 1)
        heading.backgroundColor = .clear
        heading.font = UIFont(name: "Lato-Bold", size: 35)
        heading.font = UIFont.systemFont(ofSize: 28, weight: .semibold)
        heading.text = restaurant.name
        heading.textAlignment = .center
        heading.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(heading)
        
        backButton.setTitle("< Back", for: .normal)
        backButton.setTitleColor(UIColor(red: 1, green: 0.988, blue: 0.883, alpha: 1), for: .normal)
        backButton.backgroundColor = .clear
        backButton.titleLabel?.font = UIFont(name: "Lato-Bold", size: 20)
        backButton.titleLabel?.font = UIFont.systemFont(ofSize: 18, weight: .semibold)
        backButton.addTarget(self, action: #selector(backButtonTapped), for: .touchUpInside)
        backButton.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(backButton)
        
        submitButton.setTitle("Submit", for: .normal)
        submitButton.setTitleColor(UIColor(red: 1, green: 0.988, blue: 0.883, alpha: 1), for: .normal)
        submitButton.backgroundColor = .clear
        submitButton.titleLabel?.font = UIFont(name: "Lato-Bold", size: 20)
        submitButton.titleLabel?.font = UIFont.systemFont(ofSize: 18, weight: .semibold)
        submitButton.addTarget(self, action: #selector(submitReview), for: .touchUpInside)
        submitButton.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(submitButton)
        
        
        commentLabel.textColor = UIColor(red: 1, green: 0.988, blue: 0.883, alpha: 1)
        commentLabel.font = UIFont(name: "Lato-Bold", size: 22)
        commentLabel.font = UIFont.systemFont(ofSize: 22, weight: .semibold)
        commentLabel.text = "Comment"
        commentLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(commentLabel)
        
        commentTextView.textContainerInset = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        commentTextView.autocorrectionType = .no
        commentTextView.textColor = UIColor(red: 1, green: 0.988, blue: 0.883, alpha: 1)
        commentTextView.font = UIFont(name: "Lato-Bold", size: 22)
        commentTextView.font = UIFont.systemFont(ofSize: 22, weight: .regular)
        commentTextView.layer.backgroundColor = UIColor(red: 0.753, green: 0.11, blue: 0.176, alpha: 0.26).cgColor
        commentTextView.layer.cornerRadius = 22.2
        commentTextView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(commentTextView)
        
        uploadLabel.textColor = UIColor(red: 1, green: 0.988, blue: 0.883, alpha: 1)
        uploadLabel.font = UIFont(name: "Lato-Bold", size: 22)
        uploadLabel.font = UIFont.systemFont(ofSize: 22, weight: .semibold)
        uploadLabel.text = "Upload File"
        uploadLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(uploadLabel)
        
        uploadButton.setImage(UIImage(named: "add-file"), for: .normal)
        uploadButton.addTarget(self, action: #selector(uploadButtonTapped), for: .touchUpInside)
        uploadButton.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(uploadButton)
        
        uploadImageView.layer.cornerRadius = 12
        uploadImageView.clipsToBounds = true
        uploadImageView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(uploadImageView)
        
        ratingLabel.textColor = UIColor(red: 1, green: 0.988, blue: 0.883, alpha: 1)
        ratingLabel.font = UIFont(name: "Lato-Bold", size: 22)
        ratingLabel.font = UIFont.systemFont(ofSize: 22, weight: .semibold)
        ratingLabel.text = "Rating"
        ratingLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(ratingLabel)
        
        sliderBox.image = UIImage(named: "slider-box")
        sliderBox.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(sliderBox)
        
        ratingSlider.minimumValue = 1
        ratingSlider.maximumValue = 5.99
        ratingSlider.value = 3
        ratingSlider.minimumTrackTintColor = .black
        ratingSlider.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(ratingSlider)
        
        setupConstraints()

    }
    
    func setupConstraints() {
        
        NSLayoutConstraint.activate([
            header.topAnchor.constraint(equalTo: view.topAnchor),
            header.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
        
        NSLayoutConstraint.activate([
            footer.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            footer.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
        
        NSLayoutConstraint.activate([
            heading.topAnchor.constraint(equalTo: header.bottomAnchor),
            heading.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            heading.widthAnchor.constraint(equalToConstant: 390),
            heading.heightAnchor.constraint(equalToConstant: 48)
        ])
        
        NSLayoutConstraint.activate([
            commentLabel.topAnchor.constraint(equalTo: heading.bottomAnchor, constant: 5),
            commentLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 38),
        ])
        
        NSLayoutConstraint.activate([
            commentTextView.topAnchor.constraint(equalTo: commentLabel.bottomAnchor, constant: 6),
            commentTextView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            commentTextView.widthAnchor.constraint(equalToConstant: 318),
            commentTextView.heightAnchor.constraint(equalToConstant: 97)
        ])
        
        NSLayoutConstraint.activate([
            uploadLabel.topAnchor.constraint(equalTo: commentTextView.bottomAnchor, constant: 18),
            uploadLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 38),
        ])
        
        NSLayoutConstraint.activate([
            uploadButton.topAnchor.constraint(equalTo: uploadLabel.bottomAnchor, constant: 6),
            uploadButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 38),
            uploadButton.widthAnchor.constraint(equalToConstant: 68),
            uploadButton.heightAnchor.constraint(equalToConstant: 63)
        ])
        
        NSLayoutConstraint.activate([
            uploadImageView.topAnchor.constraint(equalTo: commentTextView.bottomAnchor, constant: 32),
            uploadImageView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -38),
            uploadImageView.widthAnchor.constraint(equalToConstant: 113),
            uploadImageView.heightAnchor.constraint(equalToConstant: 95)
        ])
        
        NSLayoutConstraint.activate([
            ratingLabel.topAnchor.constraint(equalTo: uploadButton.bottomAnchor, constant: 18),
            ratingLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 38),

        ])
        
        NSLayoutConstraint.activate([
            sliderBox.topAnchor.constraint(equalTo: ratingLabel.bottomAnchor, constant: 6),
            sliderBox.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            sliderBox.widthAnchor.constraint(equalToConstant: 318),
            sliderBox.heightAnchor.constraint(equalToConstant: 92)

        ])
        
        NSLayoutConstraint.activate([
            ratingSlider.topAnchor.constraint(equalTo: ratingLabel.bottomAnchor, constant: 15),
            ratingSlider.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            ratingSlider.widthAnchor.constraint(equalToConstant: 277),
            ratingSlider.heightAnchor.constraint(equalToConstant: 33)
        ])
        
        
        NSLayoutConstraint.activate([
            backButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 25),
            backButton.bottomAnchor.constraint(equalTo: footer.bottomAnchor, constant: -36)
        ])
        
        NSLayoutConstraint.activate([
            submitButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -25),
            submitButton.bottomAnchor.constraint(equalTo: footer.bottomAnchor, constant: -36)
        ])
        
        
    }
    
    @objc func uploadButtonTapped() {
        
        present(imagePicker, animated: true, completion: nil)
        
    }
    
    @objc func backButtonTapped() {
          if let reviewVC = navigationController?.viewControllers.first(where: { $0 is ReviewViewController }) {
              navigationController?.popToViewController(reviewVC, animated: true)
              delegate?.reloadView()
          }
      }
    
    @objc func submitReview() {
        
        let contents = commentTextView.text ?? ""
        let rating = Int(ratingSlider.value)
//        let foodPicData = String(((uploadImage?.jpegData(compressionQuality: 1))?.base64EncodedString(options: Data.Base64EncodingOptions.lineLength64Characters))!)
//
//        print(foodPicData, "HEYYY")

        NetworkManager.shared.createReview(hall_id:self.restaurant.hall_id, user_id: self.user.user_id, contents: contents, rating: rating, with_image: self.isImage, image_data: "") { response in
            DispatchQueue.main.sync {
                NetworkManager.shared.getRestaurant(hall_id: self.restaurant.hall_id) { response in
                    DispatchQueue.main.sync {
                        let reviewsVC = ReviewViewController(restaurant: response, user: self.user)
                        self.navigationController?.pushViewController(reviewsVC, animated: true)
                            }
                        }
                    }
                }
        }
    
    
//    func UploadImage(){
//            // your image from Image picker, as of now I am picking image from the bundle
//        let image = self.uploadImage
//        let imageData = image?.jpegData(compressionQuality: 0.7)
//        let baseurl = "http://34.85.222.240/api/hall/"
//        let url = URL(string: baseurl + String(restaurant.hall_id) + "/reviews/")!
//        var urlRequest = URLRequest(url: url)
//
//        urlRequest.httpMethod = "post"
//        let bodyBoundary = "--------------------------\(UUID().uuidString)"
//        urlRequest.addValue("multipart/form-data; boundary=\(bodyBoundary)", forHTTPHeaderField: "Content-Type")
//
//        //attachmentKey is the api parameter name for your image do ask the API developer for this
//       // file name is the name which you want to give to the file
//        let requestData = createRequestBody(imageData: imageData!, boundary: bodyBoundary, attachmentKey: "reviewPicture", fileName: "1.jpg")
//
//        urlRequest.addValue("\(requestData.count)", forHTTPHeaderField: "content-length")
//        urlRequest.httpBody = requestData
//
//        URLSession.shared.dataTask(with: urlRequest) { (data, httpUrlResponse, error) in
//
//            if(error == nil && data != nil && data?.count != 0){
//                do {
//                    let response = try JSONDecoder().decode(???, from: data!)
//                    print(response)
//                }
//
//                catch let decodingError {
//                    debugPrint(decodingError)
//                }
//            }
//        }.resume()
//        }
//
//        func createRequestBody(imageData: Data, boundary: String, attachmentKey: String, fileName: String) -> Data{
//            let lineBreak = "\r\n"
//            var requestBody = Data()
//
//            requestBody.append("\(lineBreak)--\(boundary + lineBreak)" .data(using: .utf8)!)
//            requestBody.append("Content-Disposition: form-data; name=\"\(attachmentKey)\"; filename=\"\(fileName)\"\(lineBreak)" .data(using: .utf8)!)
//            requestBody.append("Content-Type: image/jpeg \(lineBreak + lineBreak)" .data(using: .utf8)!) // you can change the type accordingly if you want to
//            requestBody.append(imageData)
//            requestBody.append("\(lineBreak)--\(boundary)--\(lineBreak)" .data(using: .utf8)!)
//
//            return requestBody
//        }
//
//
    }




extension WriteReviewViewController: UIImagePickerControllerDelegate & UINavigationControllerDelegate {
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let selectedImage = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
            
            uploadImage = selectedImage
            uploadImageView.image = uploadImage
//            isImage = true
//            UploadImage()
                        
            // Do something with the selected image
        }
        dismiss(animated: true, completion: nil)
    }
    
}

protocol ReloadViewDelegate: UIViewController {
    func reloadView()
}
