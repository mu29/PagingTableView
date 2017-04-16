Pod::Spec.new do |s|
  s.name         = "PagingTableView"
  s.version      = "0.1.0"
  s.summary      = "The simplest way to make your table view paginable"
  s.homepage     = "https://github.com/mu29/PagingTableView"

  s.license      = { :type => 'MIT', :file => 'LICENSE' }
  s.author       = { "InJung Chung" => "mu29@yeoubi.net" }
  s.source       = { :git => 'https://github.com/mu29/PagingTableView.git', :tag => s.version.to_s }

  s.ios.deployment_target = '8.0'

  s.source_files = 'Sources'
  s.frameworks   = 'UIKit', 'Foundation'
end
