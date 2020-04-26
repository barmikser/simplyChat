platform :ios, "13.0"
inhibit_all_warnings!
use_frameworks!

def pods_list
    #pod 'AsyncSwift', '2.0.1'
    #pod 'MagicalRecord', '2.3.2'
    #pod 'SVProgressHUD', '2.1.2'
    #pod 'ReachabilitySwift'
    #pod 'IQKeyboardManagerSwift'
    pod 'SwiftLint'
    pod 'Firebase/Analytics'
    pod 'Firebase/Auth'
    pod 'Firebase/Firestore'
    pod 'Firebase/Database'
    pod 'Firebase/Storage'
end

target 'SimplyChat' do
    pods_list
end

post_install do |installer|
    installer.pods_project.targets.each do |target|
        target.build_configurations.each do |configuration|
            configuration.build_settings['SWIFT_VERSION'] = "3.0"
        end
    end
end
