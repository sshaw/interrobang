# coding: utf-8
require "minitest/autorun"
require "interrobang"

class A
  def self.baz
    1
  end

  def self.foo!
    2
  end

  def self.bar?
    true
  end

  def baz
    3
  end

  def foo!
    4
  end

  def bar?
    false
  end
end

class B
  def self.baz
    1
  end

  def self.foo!
    2
  end

  def self.bar?
    true
  end

  def baz
    3
  end

  def foo!
    4
  end

  def bar?
    true
  end
end

class TestInterrobang < MiniTest::Test
  def teardown
    [A, B].each do |klass|
      klass.class_eval do
        remove_method(:bar‽) if method_defined?(:bar‽)
        remove_method(:foo‽) if method_defined?(:foo‽)

        class << self
          remove_method(:bar‽) if method_defined?(:bar‽)
          remove_method(:foo‽) if method_defined?(:foo‽)
        end
      end
    end
  end

  def test_everything_only_aliases_predicate_and_bang_class_methods
    Interrobang.everything

    assert_equal 2, A.foo‽
    assert A.bar‽
    assert !A.respond_to?(:baz‽)

    assert_equal 2, B.foo‽
    assert B.bar‽
    assert !B.respond_to?(:baz‽)
  end

  def test_everything_does_not_modify_existing_class_methods
    Interrobang.everything

    assert_equal 1, A.baz
    assert_equal 2, A.foo!
    assert_equal true, A.bar?

    assert_equal 1, B.baz
    assert_equal 2, B.foo!
    assert_equal true, B.bar?
  end

  def test_everything_only_aliases_predicate_and_bang_instance_methods
    Interrobang.everything

    a = A.new
    assert_equal 4, a.foo‽
    assert !a.bar‽
    assert !a.respond_to?(:baz‽)

    b = B.new
    assert_equal 4, b.foo‽
    assert b.bar‽
    assert !b.respond_to?(:baz‽)
  end

  def test_everything_does_not_modify_existing_instance_methods
    Interrobang.everything

    a = A.new
    assert_equal 3, a.baz
    assert !a.bar?
    assert_equal 4, a.foo!

    b = B.new
    assert_equal 3, a.baz
    assert b.bar?
    assert_equal 4, b.foo!
  end

  def test_only_aliases_only_predicate_and_bang_class_methods_for_the_given_class
    Interrobang.only(A)

    assert_equal 2, A.foo‽
    assert A.bar‽
    assert !A.respond_to?(:baz‽)

    assert !B.respond_to?(:foo‽)
    assert !B.respond_to?(:baz‽)
  end

  def test_only_aliases_only_predicate_and_bang_instance_methods_for_the_given_class
    Interrobang.only(A)

    a = A.new
    assert !a.bar‽
    assert_equal 4, a.foo‽
    assert !a.respond_to?(:baz‽)

    b = B.new
    assert !b.respond_to?(:foo‽)
    assert !b.respond_to?(:bar‽)
  end
end
