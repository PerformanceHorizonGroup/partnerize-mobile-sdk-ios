Pod::Spec.new do |s|
    s.name              = 'Partnerize'
    s.version           = '1.2.10'
    s.summary           = 'Partnerize App Tracking iOS framework.'
    s.description       = 'App Tracking SDK provided by Parnerize to aid advertisers in connecting in-app purchases to their performance marketing activity.'
    s.homepage          = 'https://github.com/PerformanceHorizonGroup/partnerize-mobile-sdk-ios'

    s.author            = { 'Partnerize Product Development' => 'prod_dev@partnerize.com' }
    s.license           = { :type => 'Apache License, Version 2.0', :file => 'PartnerizePod/LICENSE' }
    s.swift_version     = '4.2'
    s.platform          = :ios, '9.0'
    s.source            = { :http => 'https://github.com/PerformanceHorizonGroup/partnerize-mobile-sdk-ios/releases/download/1.2.10/PartnerizePod.zip' }
    s.source_files      = 'PartnerizePod/Partnerize.framework/Headers/*.{h,m}'
    s.ios.deployment_target = '9.0'
    s.ios.vendored_frameworks = 'PartnerizePod/Partnerize.framework'
    s.pod_target_xcconfig = { 'EXCLUDED_ARCHS[sdk=iphonesimulator*]' => 'arm64' }
    s.user_target_xcconfig = { 'EXCLUDED_ARCHS[sdk=iphonesimulator*]' => 'arm64' }

end
