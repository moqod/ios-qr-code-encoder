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

#import "UIImage+MDQRCode.h"
#import "qrencode.h"

@implementation UIImage (MDQRCode)

#pragma mark - private

+ (void)mdDrawQRCode:(QRcode *)code context:(CGContextRef)ctx size:(CGFloat)size fillColor:(UIColor *)fillColor {
	int margin = 0;
	unsigned char *data = code->data;
	int width = code->width;
	int totalWidth = width + margin * 2;
	int imageSize = (int)floorf(size);
	
	// @todo - review float->int stuff
	int pixelSize = imageSize / totalWidth;
	if (imageSize % totalWidth) {
		pixelSize = imageSize / width;
		margin = (imageSize - width * pixelSize) / 2;
	}
	
	CGRect rectDraw = CGRectMake(0.0f, 0.0f, pixelSize, pixelSize);
	// draw
	CGContextSetFillColorWithColor(ctx, fillColor.CGColor);
	for(int i = 0; i < width; ++i) {
		for(int j = 0; j < width; ++j) {
			if(*data & 1) {
				rectDraw.origin = CGPointMake(margin + j * pixelSize, margin + i * pixelSize);
				CGContextAddRect(ctx, rectDraw);
			}
			++data;
		}
	}
	CGContextFillPath(ctx);
}

#pragma mark - public

+ (UIImage *)mdQRCodeForString:(NSString *)qrString size:(CGFloat)size {
	return [self mdQRCodeForString:qrString size:size fillColor:[UIColor blackColor]];
}

+ (UIImage *)mdQRCodeForString:(NSString *)qrString size:(CGFloat)imageSize fillColor:(UIColor *)fillColor {
	if (0 == [qrString length]) {
		return nil;
	}
	
	// generate QR
	QRcode *code = QRcode_encodeString([qrString UTF8String], 0, QR_ECLEVEL_L, QR_MODE_8, 1);
	if (!code) {
		return nil;
	}
	
	CGFloat size = imageSize * [[UIScreen mainScreen] scale];
	if (code->width > size) {
		printf("Image size is less than qr code size (%d)\n", code->width);
		return nil;
	}
	
	// create context
	CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();
	
	// The constants for specifying the alpha channel information are declared with the CGImageAlphaInfo type but can be passed to this parameter safely.

	CGContextRef ctx = CGBitmapContextCreate(0, size, size, 8, size * 4, colorSpace, (CGBitmapInfo)kCGImageAlphaPremultipliedLast);
	
	CGAffineTransform translateTransform = CGAffineTransformMakeTranslation(0, -size);
	CGAffineTransform scaleTransform = CGAffineTransformMakeScale(1, -1);
	CGContextConcatCTM(ctx, CGAffineTransformConcat(translateTransform, scaleTransform));
	
	// draw QR on this context
	[self mdDrawQRCode:code context:ctx size:size fillColor:fillColor];
	
	// get image
	CGImageRef qrCGImage = CGBitmapContextCreateImage(ctx);
	UIImage * qrImage = [UIImage imageWithCGImage:qrCGImage];
	
	// free memory
	CGContextRelease(ctx);
	CGImageRelease(qrCGImage);
	CGColorSpaceRelease(colorSpace);
	QRcode_free(code);
	return qrImage;
}

@end
