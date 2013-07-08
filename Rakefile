#  Copyright (c) 2009 Steve DeWald
# 
#  Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:
#   
#  The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.  
#  
#  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.  
#
require 'rake'
require 'erb'

task :default => [:install]

desc "install the dot files into user's home directory"
task :install do
  replace_all = false
  Dir['*'].each do |file|
    next if %w[Rakefile README.md LICENSE bundleinstall.vim].include? file
 
    dotfile = ".#{file.sub('.erb', '')}" 
    if File.exist?(File.join(ENV['HOME'], dotfile))
      if File.identical? file, File.join(ENV['HOME'], dotfile)
        puts "identical ~/#{dotfile}"
      elsif replace_all
        replace_file(file)
      else
        print "overwrite ~/#{dotfile}? [ynaq] "
        case $stdin.gets.chomp
        when 'a'
          replace_all = true
          replace_file(file)
        when 'y'
          replace_file(file)
        when 'q'
          exit
        else
          puts "skipping ~/#{dotfile}"
        end
      end
    else
      link_file(file)
    end
  end

  # Clone vundle to get vim going
  if (Dir.entries(File.join(ENV['HOME'], ".vim/bundle/vundle")) - %w{ . .. }).empty?
    print "Installing vundle"
    system %Q{git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle}
  end

  print "Updating vundle"
  system %{vim -s bundleinstall.vim}
end

def replace_file(file)
  system %Q{rm -rf "$HOME/.#{file.sub('.erb', '')}"}
  link_file(file)
end

def link_file(file)
  if file =~ /.erb$/
    puts "generating ~/.#{file.sub('.erb', '')}"
    File.open(File.join(ENV['HOME'], ".#{file.sub('.erb', '')}"), 'w') do |new_file|
      new_file.write ERB.new(File.read(file)).result(binding)
    end
  else
    puts "linking ~/.#{file}"
    system %Q{ln -s "$PWD/#{file}" "$HOME/.#{file}"}
  end
end
