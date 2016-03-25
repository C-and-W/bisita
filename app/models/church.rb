class Church < ActiveRecord::Base
  has_many :artistic_values, dependent: :destroy
  has_many :facts, dependent: :destroy
  has_many :timeline_points, dependent: :destroy
  has_many :travel_times, dependent: :destroy
  has_many :panos

  accepts_nested_attributes_for :artistic_values, :allow_destroy => true
  accepts_nested_attributes_for :facts, :allow_destroy => true
  accepts_nested_attributes_for :timeline_points, :allow_destroy => true
  accepts_nested_attributes_for :travel_times, :allow_destroy => true

  include PgSearch
  pg_search_scope :search, :against => {:name => 'A', :location => 'C', :architecture => 'B', :make => 'B', :background => 'D'}, 
      :associated_against => {:artistic_values => [:description], :facts => [:description], :timeline_points => [:description]}
      #,:using => {:tsearch => {:start_sel => '<b>', :stop_sel => '</b>'}}
    
end