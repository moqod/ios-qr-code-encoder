Pod::Spec.new do |s|
    s.name            = 'QRCodeEncoder'
    s.version         = '1.0'
    s.platform        = :ios, '7.0'
    s.license         = { :type => 'MIT', :file => 'LICENSE' }
    s.summary         = 'QRCode Encoder For Your iOS app.'
    s.homepage        = 'https://github.com/Notan/ios-qr-code-encoder'
    s.authors         = { 'Alex Zarochintsev' => 'alex.zarochintsev@icloud.com' }
    s.source          = { :git => 'https://github.com/Notan/ios-qr-code-encoder', :tag => "1.0" }

    s.source_files = 'QRCode/QR/**/*.{h,m,c}'

    s.framework       = 'Foundation', 'UIKit'
    s.requires_arc    = true
end