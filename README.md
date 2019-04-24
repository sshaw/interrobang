# Interrobang

Can't remember if the method ended with `?` or `!`‽ Interrobang solves this by giving you the best of both worlds.

## Usage

```rb
require "interrobang"

class Foo
  def bar!
    "something amaaaaazing!"
  end

  def baz?
    false
  end
end

Interrobang.only(Foo)

foo = Foo.new
foo.bar!     # "something amaaaaazing!"
foo.bar‽     # "something amaaaaazing!"
foo.baz?     # false
foo.baz‽     # false
```


Feeling _really_ forgetful, no problem:

```
Interrobang.everything

%w[foo bar baz].include?("baz")  # true
%w[foo bar baz].include‽("baz")  # true

"sshaw!".chop!  # "sshaw"
"sshaw!".chop‽  # "sshaw"
```

## See Also

* [AngryRaise](https://github.com/sshaw/angry_raise) - `raise` exceptions, with emotion and intensity
* [class2](https://github.com/sshaw/class2) - DSL for creating class hierarchies
* [require3](https://github.com/sshaw/require3) - `Kernel#require` something and make it accessible via a different namespace
* [YYMMDD](https://github.com/sshaw/yymmdd) - Tiny DSL for idiomatic date parsing and

## Author

Skye Shaw [skye.shaw AT gmail]

## License

Released under the MIT License: http://www.opensource.org/licenses/MIT
