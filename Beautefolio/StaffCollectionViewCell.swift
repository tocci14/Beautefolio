//  StaffCollectionViewCell.swift
//  Beautefolio


import UIKit
import Firebase


// 画像を丸く切り抜く
// http://dev.classmethod.jp/smartphone/iphone/ios_swift_image_mask/

extension UIImage {
    func mask(image: UIImage?) -> UIImage {
        if let maskRef = image?.cgImage,
            let ref = cgImage,
            let mask = CGImage(maskWidth: maskRef.width,
            height: maskRef.height,
            bitsPerComponent: maskRef.bitsPerComponent,
            bitsPerPixel: maskRef.bitsPerPixel,
            bytesPerRow: maskRef.bytesPerRow,
            provider: maskRef.dataProvider!,
            decode: nil,
            shouldInterpolate: false),
            let output = ref.masking(mask) {
            return UIImage(cgImage: output)
        }
        return self
    }
}

class StaffCollectionViewCell: UICollectionViewCell, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    let numberColumns = 4 // 列数
    let height:CGFloat = 250 // セルの高さ
    
    @IBOutlet weak var staffImage: UIImageView!
    @IBOutlet weak var staffName: UITextField!
    
    @IBAction func addPic(_ sender: UIButton) {
        // ライブラリ（カメラロール）を指定してピッカーを開く
        if UIImagePickerController.isSourceTypeAvailable(UIImagePickerControllerSourceType.photoLibrary) {
            let pickerController = UIImagePickerController()
            pickerController.delegate = self
            pickerController.sourceType = UIImagePickerControllerSourceType.photoLibrary
            //self.present(pickerController, animated: true, completion: nil)
            
            /*if UIImagePickerController.isSourceTypeAvailable(UIImagePickerControllerSourceType.photoLibrary) {
                
                let picker = UIImagePickerController()
                picker.modalPresentationStyle = UIModalPresentationStyle.popover
                picker.delegate = self // UINavigationControllerDelegate と　UIImagePickerControllerDelegateを実装する
                picker.sourceType = UIImagePickerControllerSourceType.photoLibrary
                
                if let popover = picker.popoverPresentationController {
                    popover.sourceView = self.view
                    popover.sourceRect = loadImageButton.frame // ポップオーバーの表示元となるエリア
                    popover.permittedArrowDirections = UIPopoverArrowDirection.any
                }
                self.present(picker, animated: true, completion: nil)
            }*/
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        
        // 選択された画像
        let selectImage = info[UIImagePickerControllerOriginalImage] as? UIImage
        staffImage.image = selectImage?.mask(image: UIImage(named:"mask"))

        //diss.miss(animated:true,completion: nil)
            
        //let imgRef = image.cgImage?.cropping(to: CGRect)
        //let image = UIImage(cgImage: imgRef!, scale: image.scale, orientation: image.imageOrientation)
        /*func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
            
            if let staffImage = info[UIImagePickerControllerOriginalImage] as? UIImage {
                // pickedImageが読み込まれた画像なので、あとはお好きに
            }
            picker.dismiss(animated: true, completion: nil)
        }*/
        }
        /*if UIImagePickerController.isSourceTypeAvailable(UIImagePickerControllerSourceType.camera) {
            
            let picker = UIImagePickerController()
            picker.modalPresentationStyle = UIModalPresentationStyle.fullScreen
            picker.delegate = self　// UINavigationControllerDelegate と　UIImagePickerControllerDelegateを実装する
            picker.sourceType = UIImagePickerControllerSourceType.camera
            
            self.present(picker, animated: true, completion: nil)
        }*/
    }
    
    
 
    @IBAction func workSwitch(_ sender: UISwitch) {
        if ( sender.isOn ) {
            
        } else {
            
        }
    }

}
