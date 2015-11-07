# Uncomment this line to define a global platform for your project
source 'https://github.com/CocoaPods/Specs.git'

platform :ios, '7.0'

xcodeproj 'Frievel'

pod 'AFNetworking', '3.0.0-beta.1'

target 'Frievel' do
end

post_install do |installer|
    installer.pods_project.targets.each do |target|
        puts target.name
    end
end

