# iOS QR Code Encoder

This is an Objective-C library that helps to easily convert a UIImage with a QR-code from NSString with just one line of code. It uses [qrencode](https://github.com/fukuchi/libqrencode) to generate QR code and CoreGraphics to draw an image.
<br />

When integrating this solution to your project, please, spare us a like on [Facebook](http://fb.me/moqod), follow us on [Twitter](http://twitter.com/moqod) or spread a good word about us!
<br />

Feel free to get in touch with us in regards to any questions or cooperation requests via email [info@moqod.com](mailto:info@moqod.com).
<br />

# Customization
To change the fill color you need to pass `fillColor` parameter in the method:
``` objc
+ (UIImage *)mdQRCodeForString:(NSString *)qrString size:(CGFloat)size fillColor:(UIColor *)fillColor;
```

# Sample
``` objc
    // image view is an instance of UIImageView
    imageView.image = [UIImage mdQRCodeForString:@"Hello, world!" size:imageView.bounds.size.width fillColor:[UIColor darkGrayColor]];
```

# License
MIT
