//
// QR Code Generator - generates UIImage from NSString
// Copyright (C) 2012 http://moqod.com Andrew Kopanev <andrew@moqod.com>
//
// This program is free software; you can redistribute it and/or
// modify it under the terms of the GNU General Public License
// as published by the Free Software Foundation; either version 2
// of the License, or (at your option) any later version.
//
// This program is distributed in the hope that it will be useful,
// but WITHOUT ANY WARRANTY; without even the implied warranty of
// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
// GNU General Public License for more details.
//
// You should have received a copy of the GNU General Public License
// along with this program; if not, write to the Free Software
// Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA  02110-1301, USA.
//

#import "QRCodesGeneratorAppDelegate.h"
#import "QRCodeGenerator.h"

@implementation QRCodesGeneratorAppDelegate
@synthesize window;

#pragma mark - Application lifecycle

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
	
	// sample
	UIImageView * imageView = [[[UIImageView alloc] initWithFrame:CGRectMake(10, 50, 300, 300)] autorelease];
	imageView.image = [QRCodeGenerator qrImageForString:@"Hello, world!" imageSize:imageView.bounds.size.width];
	[self.window addSubview: imageView];
    [self.window makeKeyAndVisible];
    return YES;
}

#pragma mark - Memory management

- (void)dealloc {
    [window release];
    [super dealloc];
}

@end
