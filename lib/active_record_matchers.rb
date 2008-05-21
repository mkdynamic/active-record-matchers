require 'active_record_matchers/validations'
require 'active_record_matchers/associations'

module ActiveRecordMatchers 
  include Associations
  include Validations 
end