# coding: utf-8
# frozen_string_literal: true

module Interrobang
  VERSION = "0.0.1"

  def only(*thangz_to_bang)
    thangz_to_bang.flatten!
    thangz_to_bang.each do |thang|
      bang_instance(thang)
      bang_class(thang)
    end
    nil
  end

  module_function :only

  def everything
    # Better way than object space
    only(*ObjectSpace.each_object(Module))
    nil
  end

  module_function :everything

  class << self
    private

    def bang?(sym)
      name = sym.to_s
      name.end_with?("!") || name.end_with?("?")
    end

    # TODO: worthwhile to combine xxx? and xxx! method calls?
    def bang_class(thang)
      thang.public_methods.each do |sym|
        next unless bang?(sym)
        thang.instance_eval <<-END
          class << self
            alias_method "#{sym[0..-2]}‽", "#{sym}"
          end
        END
      end
    end

    def bang_instance(thang)
      thang.public_instance_methods.each do |sym|
        next unless bang?(sym)
        thang.class_eval { alias_method "#{sym[0..-2]}‽", sym }
      end
    end
  end
end
