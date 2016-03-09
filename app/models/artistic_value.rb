class ArtisticValue < ActiveRecord::Base
  belongs_to :church

  searchable do
    text :description, :stored => true
  end
end
