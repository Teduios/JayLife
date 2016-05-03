//
//  XJChangeImage.m
//  生活大爆炸
//
//  Created by 沈徐洁 on 16/4/29.
//  Copyright © 2016年 沈徐洁. All rights reserved.
//

#import "XJChangeImage.h"

@interface XJChangeImage ()<UIImagePickerControllerDelegate>
@property (weak, nonatomic) IBOutlet UIImageView *headImageView;
- (IBAction)selectPicClick:(id)sender;
@end

@implementation XJChangeImage

-(void)chooseHeadImage:(UIImagePickerControllerSourceType)type {
    UIImagePickerController *imagePicker = [[UIImagePickerController alloc]init];
    //允许编辑图片
    imagePicker.allowsEditing = YES;
    //类型 是 相机  或  相册
    imagePicker.sourceType = type;
    //设置代理
    imagePicker.delegate = self;
    
    [self presentViewController:imagePicker animated:YES completion:nil];
    
}

//imagePickerController 代理方法，当我们选择完图片是调用，会把选择的图片，通过参数交给我
-(void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary<NSString *,id> *)info {
    //把选中图片取出来
    UIImage *image = info[UIImagePickerControllerEditedImage];
    self.headImageView.image = image;
    //文件路径
    NSString *filePath = [NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES)[0] stringByAppendingPathComponent:@"headImage.data"];
    //归档
    [NSKeyedArchiver archiveRootObject:image toFile:filePath];
    [self.delegate FinishSelectHeadImageWith:self andHeadImage:image];
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)viewDidLoad {
    self.headImageView.image=self.headimage_head;
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)selectPicClick:(id)sender {
    UIAlertController* alert=[UIAlertController alertControllerWithTitle:nil message:nil preferredStyle:0];
    UIAlertAction* action1=[UIAlertAction actionWithTitle:@"拍照" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        [self chooseHeadImage:(UIImagePickerControllerSourceTypeCamera)];
    }];
    UIAlertAction* action2=[UIAlertAction actionWithTitle:@"从手机相册选择" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        [self chooseHeadImage:(UIImagePickerControllerSourceTypePhotoLibrary)];
    }];
    UIAlertAction* action3=[UIAlertAction actionWithTitle:@"保存图片" style:UIAlertActionStyleDefault handler:nil];
    UIAlertAction* action4=[UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:nil];
    [alert addAction:action1];
    [alert addAction:action2];
    [alert addAction:action3];
    [alert addAction:action4];
    [self presentViewController:alert animated:YES completion:nil];
}
@end
