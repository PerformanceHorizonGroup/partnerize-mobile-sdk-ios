Pod::Spec.new do |s|
    s.name              = 'Partnerize'
    s.module_name       = 'PartnerizeSDK'
    s.version           = '2.1.3'
    s.summary           = 'Partnerize App Tracking iOS framework.'
    s.description       = 'App Tracking SDK provided by Partnerize to aid advertisers in connecting in-app purchases to their performance marketing activity.'
    s.homepage          = 'https://github.com/PerformanceHorizonGroup/partnerize-mobile-sdk-ios'

    s.author            = { 'Partnerize Product Development' => 'prod_dev@partnerize.com' }
    s.license           = { :type => 'Apache License, Version 2.0', :file => 'PartnerizePod/LICENSE' }
    s.swift_version     = '4.2'
    s.platform          = :ios, '16.0'
    s.source            = { :http => 'https://github.com/PerformanceHorizonGroup/partnerize-mobile-sdk-ios/releases/download/2.1.3/PartnerizePod.zip' }
    s.ios.deployment_target = '16.0'
    s.ios.vendored_frameworks = 'PartnerizePod/PartnerizeSDK.xcframework'
end
