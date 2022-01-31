import UIKit

class NoteViewController: UIViewController {
    
    @IBOutlet weak var titlefield: UITextField!
    @IBOutlet weak var detailfield: UITextView!
    
    public var completion: ((String, String) -> Void)?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        titlefield.becomeFirstResponder()
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Save", style: .done, target: self, action: #selector(didTapSave))
        
    }
    
    @objc func didTapSave() {
        if let text = titlefield.text, !text.isEmpty, !detailfield .text.isEmpty {
            completion?(text, detailfield.text)
        }
    }
    

}
