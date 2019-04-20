Pod::Spec.new do |s|  
    s.name              = 'Partnerize'
    s.version           = '1.1.1'
    s.summary           = 'Partnerize App Tracking iOS framework.'
    s.description       = 'App Tracking SDK provided by Parnerize to aid advertisers in connecting in-app purchases to their performance marketing activity.'
    # s.homepage          = 'https://partnerize.com/'

    s.author            = { 'Partnerize Product Development' => 'prod_dev@partnerize.com' }
    s.license           = { :type => 'Apache License, Version 2.0', :file => 'LICENSE' }

    s.platform          = :ios, '9.0'
    s.source            = { :http => 'https://github.com/PerformanceHorizonGroup/partnerize-mobile-sdk-ios/releases/download/1.1.1/PartnerizePod.zip' }
    s.source_files      = 'Partnerize.framework/Headers/PHGConversion.h', 'Partnerize.framework/Headers/PHGConversionItem.h', 'Partnerize.framework/Headers/PHGDefines.h', 'Partnerize.framework/Headers/PHGError.h', 'Partnerize.framework/Headers/Partnerize.h'
    s.ios.deployment_target = '9.0'
    s.ios.vendored_frameworks = 'Partnerize.framework'
end