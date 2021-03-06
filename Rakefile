require "erubis"

desc 'help'
task :help do
  puts "type=ruby problem=p1 rake run"
  puts "or"
  puts "t=ruby p=p1 rake run"
  puts 't=ruby p=p1 rake cat'
end

def get_command(cmd)
  type = ["clojure", "coffeescript",
          "erlang",  "haskell", 
          "io",      "javascript",
          "lua",     "newlisp",
          "ruby",    "scala"]
  ext = {"clojure" => "clj", "coffeescript" => "coffee",
         "erlang" => "erl",  "haskell" => "hs",
         "io" => "io",       "javascript" => "js",
         "lua" => "lua",     "newlisp" => "lsp",
         "ruby" => "rb",     "scala" => "scala"}

  exec = {"clojure" => "clj", "coffeescript" => "coffee",
         "erlang" => "escript",  "haskell" => "runhaskell",
         "io" => "io",       "javascript" => "node",
         "lua" => "lua",     "newlisp" => "newlisp",
         "ruby" => "ruby",     "scala" => "scala"}

  t = ENV['type'] || ENV['t']
  p = ENV['problem'] || ENV['p']
  raise "need t= when run rake run" unless t
  raise "need p= when run rake run" unless p
  if t == 'all'
    type.each do |i|
      puts "#{i}: "
      case cmd
      when "run"
        system "cd #{i}; #{exec[i]} #{p}.#{ext[i]}"
      when "cat"
        system "cd #{i}; cat #{p}.#{ext[i]}"
      when "edit"
        system "cd #{i}; vim #{p}.#{ext[i]}"
      when "create"
        system "cd #{i}; touch #{p}.#{ext[i]}"
      end
      puts ""
    end
  else
    case cmd
    when "run"
      system "cd #{t}; #{exec[t]} #{p}.#{ext[t]}"
    when "cat"
      system "cd #{t}; cat #{p}.#{ext[t]}"
    when "edit"
      system "cd #{t}; vim #{p}.#{ext[t]}"
    end
  end
end

desc 'run'
task :run do
  get_command "run"
end

desc 'cat'
task :cat do
  get_command "cat"
end

desc 'edit'
task :edit do
  get_command "edit"
end

desc 'gen files'
task :create do
  get_command "create"
end

desc 'gen gh-pags'
task :page do
  p = ENV['p']
  raise 'need p, try p=p1 rake page' unless p

  # 1 get all problems
  ps = Dir.entries('problems')
    .select{|d| d.include?('md')}
    .map{|d| d.split('.')[0]}

  # 2 get template
  input = File.read('template/p.html.erb')
  eruby = Erubis::Eruby.new(input)

  # 3 get the code

  type = ["clojure", "coffeescript",
          "erlang",  "haskell", 
          "io",      "javascript",
          "lua",     "newlisp",
          "ruby",    "scala"]
  ls = []
  type.each do |t|
    lang = {:name => t, :code => `cat #{t}/#{p}*`}
    ls.push(lang)
  end
  # 4 get the problem
  p_content = `cat problems/#{p}.md | marked`

  # 5 write html to file
  Dir.chdir('gh-pages/problems');
  File.open("#{p}.html", "w") do |f|
    f.puts eruby.result(binding())
  end
  Dir.chdir('..')
end

desc 'push gh-pages'
task :pushpage do
  Dir.chdir('gh-pages');
  system 'git add .'
  system 'git commit -a -m "update gh-pages"'
  system 'git push origin gh-pages'
  Dir.chdir('..')
  puts 'push gh-pages ok...'
end

desc 're gen pages'
task :allpage do

  # 1 get all problems
  ps = Dir.entries('problems')
    .select{|d| d.include?('md')}
    .map{|d| d.split('.')[0]}

  ps.each do |p|
    system "p=#{p} rake page"
  end
  puts "All page generate done..."

end
