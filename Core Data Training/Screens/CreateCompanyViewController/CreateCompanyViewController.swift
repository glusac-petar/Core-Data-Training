//
//  CreateCompanyViewController.swift
//  Core Data Training
//
//  Created by Petar Glusac on 7.4.21..
//

import UIKit

protocol CreateCompanyViewControllerDelegate: class {
    func didInsertCompany(company: Company)
    func didEditCompany(company: Company)
}

class CreateCompanyViewController: UIViewController, UINavigationControllerDelegate {
    
    let companyImageView = CDImageView(image: UIImage(named: "select_photo_empty"), cornerRadius: 55)
    let selectImageButton = CDButton(title: "Select Photo")
    let nameLabel = CDLabel(font: UIFont.systemFont(ofSize: 17.5, weight: .semibold), textColor: .black, text: "Name:")
    let nameTextField = CDTextField(placeholder: "Enter Name")
    let dateLabel = CDLabel(font: UIFont.systemFont(ofSize: 17.5, weight: .semibold), textColor: .black, text: "Founded:".space(8).appending(Date().convertToString()))
    let datePicker = UIDatePicker()
    
    weak var delegate: CreateCompanyViewControllerDelegate!
    
    var company: Company? {
        didSet {
            guard let imageData = company?.imageData, let name = company?.name, let date = company?.founded else { return }
            companyImageView.image = UIImage(data: imageData)
            nameTextField.text = name
            dateLabel.text = "Founded:".space(8).appending(date.convertToString())
            datePicker.date = date
        }
    }
    
    init(delegate: CreateCompanyViewControllerDelegate, company: Company? = nil) {
        super.init(nibName: nil, bundle: nil)
        self.delegate = delegate
        defer { self.company = company }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
  
        configureViewController()
        configureCompanyImageView()
        configureSelectImageButton()
        configureDatePicker()
        layoutUI()
    }
        
    private func configureViewController() {
        view.backgroundColor = .darkBlue
        title = company == nil ? "Create Company" : "Edit Company"
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .cancel, target: self, action: #selector(cancelDidTap))
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .save, target: self, action: #selector(saveDidTap))
    }
    
    private func configureCompanyImageView() { companyImageView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(companyImageViewDidTap))) }
    
    private func configureSelectImageButton() { selectImageButton.addTarget(self, action: #selector(companyImageViewDidTap), for: .touchUpInside) }
    
    private func configureDatePicker() {
        datePicker.preferredDatePickerStyle = .wheels
        datePicker.datePickerMode = .date
        datePicker.addTarget(self, action: #selector(datePickerValueDidChange), for: .valueChanged)
    }
    
    @objc private func cancelDidTap() { dismiss(animated: true) }
        
    @objc private func saveDidTap() {
        guard !nameTextField.text!.isEmpty else {
            presentAlert(title: "Woops!", message: "Name field must not be empty to save the company.")
            return
        }
        company == nil ? createCompany() : editCompany()
    }
    
    private func createCompany() {
        if let company = CoreDataManager.shared.insertCompany(imageData: companyImageView.image!.pngData()!, name: nameTextField.text!, date: datePicker.date) {
            dismiss(animated: true) { self.delegate.didInsertCompany(company: company) }
        } else { presentAlert(title: "Woops!", message: "There was an error creating this company. Please try again.") }
    }
    
    private func editCompany() {
        company?.imageData = companyImageView.image!.pngData()
        company?.name = nameTextField.text
        company?.founded = datePicker.date
        
        if CoreDataManager.shared.update() {
            dismiss(animated: true) { self.delegate.didEditCompany(company: self.company!) }
        }
        else { presentAlert(title: "Woops!", message: "There was an error updating this company. Please try again.") }
    }
    
    @objc private func companyImageViewDidTap() {
        let imagePickerController = UIImagePickerController()
        imagePickerController.delegate = self
        present(imagePickerController, animated: true)
    }
    
    @objc private func datePickerValueDidChange() { dateLabel.text = "Founded:".space(8).appending(datePicker.date.convertToString()) }
    
}

extension CreateCompanyViewController: UIImagePickerControllerDelegate {
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) { picker.dismiss(animated: true) }
        
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        let image = info[UIImagePickerController.InfoKey.originalImage] as! UIImage
        companyImageView.image = image
        picker.dismiss(animated: true)
    }
    
}
