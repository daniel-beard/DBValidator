Pod::Spec.new do |s|
  s.name = 'DBValidator'
  s.version = '1.0.0'
  s.homepage = 'https://github.com/daniel-beard/DBValidator'
  s.license = { type: 'MIT', file: 'LICENSE.md' }
  s.author 'Daniel Beard'
  s.source = { git: 'https://github.com/Dub5/DBValidator.git' }
  s.source_files = 'DBValidator'
  s.requires_arc = true
  s.summary = 'General purpose iOS/Objective-C validation framework'
  s.description = <<-DESC
DBValidator
===========
[![Build Status](https://travis-ci.org/daniel-beard/DBValidator.png?branch=master)](https://travis-ci.org/daniel-beard/DBValidator)

General purpose validation framework for objective-c / iOS.

Supports adding validation rules to any keypath on an NSObject.

* http://danielbeard.io
* http://danielbeard.wordpress.com

Copyright (C) 2013 Daniel Beard

Distributed under [MIT License](http://opensource.org/licenses/mit-license.php)

![Image](http://i.imgur.com/xmKHY.png)
DESC
end
