class Church < ActiveRecord::Base
  has_many :artistic_values, dependent: :destroy
  has_many :facts, dependent: :destroy
  has_many :timeline_points, dependent: :destroy
  has_many :travel_times, dependent: :destroy

  accepts_nested_attributes_for :artistic_values, :allow_destroy => true
  accepts_nested_attributes_for :facts, :allow_destroy => true
  accepts_nested_attributes_for :timeline_points, :allow_destroy => true
  accepts_nested_attributes_for :travel_times, :allow_destroy => true

  searchable do
    text :name, :boost => 5
    text :background, :stored => true
    # text :architecture, :stored => true
    text :artistic_values, :stored=> true do
      artistic_values.map(&:description)
    end
  end
    
end