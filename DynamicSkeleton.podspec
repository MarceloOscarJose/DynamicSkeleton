Pod::Spec.new do |s|
  s.name             = "DynamicSkeleton"
  s.version          = "0.1.0"
  s.summary          = "DynamicSkeleton - Create modilarized skeleton"
  s.homepage         = "https://github.com/MarceloOscarJose/DynamicSkeleton"
  s.author           = { "Marcelo José" => "marcelo.oscar.jose@gmail.com" }

  s.source           = { :git => "https://github.com/MarceloOscarJose/DynamicSkeleton.git", :tag => s.version.to_s}
  s.license          = 'none'
  s.platform         = :ios, '9.0'
  s.requires_arc     = true

  s.source_files = ['Pod/Classes/**/*']
  s.resources = ['Pod/Resources/**/*']

end