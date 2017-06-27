# frozen_string_literal: true

module BooleanCustom
  def to_words(opt1 = 'Yes', opt2 = 'No')
    self ? opt1 : opt2
  end

  def true?
    to_bool
  end

  def false?
    !to_bool
  end
end

class TrueClass
  include BooleanCustom

  def to_bool
    true
  end
end

class FalseClass
  include BooleanCustom

  def to_bool
    false
  end
end

class NilClass
  include BooleanCustom

  def to_bool
    false
  end
end

class String
  include BooleanCustom

  TRUE_VALUES = %w[true 1 yes on ok].freeze

  def to_bool
    TRUE_VALUES.include?(downcase)
  end
end
