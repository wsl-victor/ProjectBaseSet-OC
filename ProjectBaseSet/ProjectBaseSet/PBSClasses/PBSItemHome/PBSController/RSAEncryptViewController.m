//
//  RSAEncryptViewController.m
//  ProjectBaseSet
//
//  Created by victor on 16/9/2.
//  Copyright © 2016年 wsl. All rights reserved.
//

#import "RSAEncryptViewController.h"
#import "PBSRSAEncryptor.h"
@interface RSAEncryptViewController ()

@end

@implementation RSAEncryptViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
     self.navigationController.title=@"RSA加密";
    //原始数据
    NSString *originalString = @"====加密前===这是一段将要使用'.der'文件加密的字符串!";
    
    //使用.der和.p12中的公钥私钥加密解密
    NSString *public_key_path = [[NSBundle mainBundle] pathForResource:@"public_key.der" ofType:nil];
    NSString *private_key_path = [[NSBundle mainBundle] pathForResource:@"private_key.p12" ofType:nil];
    
    NSString *encryptStr = [PBSRSAEncryptor encryptString:originalString publicKeyWithContentsOfFile:public_key_path];
    NSString *decryptStr=[PBSRSAEncryptor decryptString:encryptStr privateKeyWithContentsOfFile:private_key_path password:@"123456"];
    
    
    
    UILabel *label=[[UILabel alloc] initWithFrame:CGRectMake(10, 80, PBSMainWidth-20, 200)];
    label.numberOfLines=0;
    label.textColor=[UIColor blackColor];
    label.font=[UIFont systemFontOfSize:12];
    [self.view addSubview:label];
    
    label.text=[NSString stringWithFormat:@"===加密前===%@===\n==加密后===%@===\n==解密后===%@=====\n",originalString,encryptStr,decryptStr];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
