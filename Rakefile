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

desc 'help'
task :help do
  puts "type=ruby problem=p1 rake run"
  puts "or"
  puts "t=ruby p=p1 rake run"

  puts 't=ruby p=p1 rake cat'
end

desc 'run'
task :run do
  t = ENV['type'] || ENV['t']
  p = ENV['problem'] || ENV['p']
  raise "need t= when run rake run" unless t
  raise "need p= when run rake run" unless p
  if t == 'all'
    type.each do |i|
      puts "#{i}: "
      system "cd #{i}; #{exec[i]} #{p}.#{ext[i]}"
      puts ""
    end
  else
    system "cd #{t}; #{exec[t]} #{p}.#{ext[t]}"
  end
end

desc 'cat'
task :cat do
  t = ENV['type'] || ENV['t']
  p = ENV['problem'] || ENV['p']
  raise "need t= when run rake run" unless t
  raise "need p= when run rake run" unless p
  system "cd #{t};cat  #{p}.#{ext[t]}"
end
