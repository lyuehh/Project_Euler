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
