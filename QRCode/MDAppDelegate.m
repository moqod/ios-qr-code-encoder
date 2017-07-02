//
// QR Code Generator - generates UIImage from NSString
//
// Copyright (C) 2012 http://moqod.com Andrew Kopanev <andrew@moqod.com>
//
// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files (the "Software"), to deal
// in the Software without restriction, including without limitation the rights
// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies
// of the Software, and to permit persons to whom the Software is furnished to do so,
// subject to the following conditions:
//
// The above copyright notice and this permission notice shall be included in all
// copies or substantial portions of the Software.
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED,
// INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR
// PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE
// FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR
// OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER
// DEALINGS IN THE SOFTWARE.
//

#import "MDAppDelegate.h"
#import "UIImage+MDQRCode.h"

@implementation MDAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
	
	UIViewController *viewController = [[UIViewController alloc] init];
	CGFloat imageSize = ceilf(viewController.view.bounds.size.width * 0.6f);
	UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(floorf(viewController.view.bounds.size.width * 0.5f - imageSize * 0.5f), floorf(viewController.view.bounds.size.height * 0.5f - imageSize * 0.5f), imageSize, imageSize)];
	[viewController.view addSubview:imageView];
//	imageView.image = [UIImage mdQRCodeForString:@"Hello, world!" size:imageView.bounds.size.width fillColor:[UIColor darkGrayColor]];
    imageView.image = [UIImage mdQRCodeForString:@"Hello, world!" size:imageView.bounds.size.width fillImage:[UIImage imageNamed:@"redButton"]];

	self.window.rootViewController = viewController;
    return YES;
}

@end
