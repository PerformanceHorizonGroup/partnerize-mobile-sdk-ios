Pod::Spec.new do |s|  
    s.name              = 'Partnerize'
    s.version           = '1.0.0'
    s.summary           = 'Partnerize App Tracking iOS framework.'
    s.description       = 'App Tracking SDK provided by Parnerize to aid advertisers in connecting in-app purchases to their performance marketing activity.'
    s.homepage          = 'https://partnerize.com/'

    s.author            = { 'Valeriy Dyryavyy' => 'valeriy.dyryavyy@partnerize.com' }
    s.license           = { :type => 'Apache License, Version 2.0', :file => 'LICENSE' }

    s.platform          = :ios, '11.0'
    s.source            = { :http => 'link to your cocoapods .zip attachment' }
    s.source_files      = 'Partnerize.framework/Headers/PHGConversion.h', 'Partnerize.framework/Headers/PHGConversionItem.h', 'Partnerize.framework/Headers/PHGDefines.h', 'Partnerize.framework/Headers/PHGError.h', 'Partnerize.framework/Headers/Partnerize.h'
    s.ios.deployment_target = '11.0'
    s.ios.vendored_frameworks = 'Partnerize.framework'
end
