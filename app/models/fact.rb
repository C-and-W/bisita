class Fact < ActiveRecord::Base
  belongs_to :church

  include PgSearch
  
end
