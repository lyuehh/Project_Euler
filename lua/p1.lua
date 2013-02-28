_ = require "underscore"
print(_.reduce(_.select(_.range(0,999):to_array(),
  function(i) return i%3==0 or i%5==0 end), 0,
    function(memo, i) return memo +i end))


