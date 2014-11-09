//
//  ViewController.m
//  testJson
//
//  Created by 賈玠倫 on 2014/11/9.
//  Copyright (c) 2014年 DNI. All rights reserved.
//

#import "ViewController.h"
#import "SBJson.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    NSURL *url = [NSURL URLWithString:@"https://public-api.wordpress.com/rest/v1.1/sites/mrchu.tw/posts/?category=news"];
    
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc] init];
    [request setURL:url];
    
    NSError *error;
    NSURLResponse *response;
    NSData *urlData = [NSURLConnection sendSynchronousRequest:request returningResponse:&response error:&error];
    
    NSString *data = [[NSString alloc]initWithData:urlData encoding:NSUTF8StringEncoding];
    //NSLog(@"data = %@", data);
    
    SBJsonParser *parser = [[SBJsonParser alloc] init];
    NSDictionary *root = [parser objectWithString:data];
    NSArray *posts = root[@"posts"];
    for (NSDictionary *post in posts) {
        //NSLog(@"post = %@", post);
        NSString *title = post[@"title"];
        NSLog(@"title = %@", title);
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
