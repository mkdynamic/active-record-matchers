module ActiveRecordMatchers
module Validations
  class RequireA
    def initialize(expected)
      @expected = expected
    end

    # Fails if target is valid or doesn't have a blank error
    def matches?(target)
      @target = target
      @target.send("#{@expected}=", nil)    
      is_valid = @target.valid? # must be run before to make the next line work
      has_errors = [@target.errors.on(@expected)].flatten.include?(I18n.translate('activerecord.errors.messages')[:blank])      
      (is_valid or !has_errors) ? false : true
    end

    def failure_message
      "expected #{@target.inspect} to require #{@expected}"
    end

    def negative_failure_message
      "expected #{@target.inspect} not to require #{@expected}"
    end
  end
  
  def require_a(expected)
    RequireA.new(expected)
  end
  alias_method :require_an, :require_a
end
end