class ArtisticValue < ActiveRecord::Base
  belongs_to :church

  include PgSearch
  
end
