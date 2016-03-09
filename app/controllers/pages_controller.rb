class PagesController < ApplicationController
  before_action :set_query, only: [:search, :results]

  def search
    if params['query'] != nil
      if @count == 0
        @message = "Sorry, we couldn't find what you searched for."
      elsif params['query'].strip.empty?
        @message = "No search query"
      else
        redirect_to results_path(:query => params['query'])
      end
    else
      render :search
    end
  end

  def login
  end

  def home
  end

  def about
  end

  def contact
  end

  def results
  end

  def suggest
  end

  private
    def set_query
      if params['query'].present?
        church_search = Church.search do
          fulltext params['query'] do 
            highlight :make
            highlight :architecture
            highlight :background, :fragment_size => 125
          end
        end
        artistic_value_search = ArtisticValue.search do 
          fulltext params['query'] do 
            highlight :description, :fragment_size => 125
          end
        end
        fact_search = Fact.search do 
          fulltext params['query'] do 
            highlight :description, :fragment_size => 125
          end
        end
        timeline_point_search = TimelinePoint.search do 
          fulltext params['query'] do 
            highlight :description, :fragment_size => 125
          end
        end

        church_results = {}
        church_search.each_hit_with_result do |hit, church|
          hit.highlights(:architecture).each do |highlight|
            church_results.merge!(["#{church.id}", "architecture"] => "Architecture: #{hit.highlight(:architecture).format { |fragment| "<strong>#{fragment}</strong>" }}")
          end
          hit.highlights(:make).each do |highlight|
            church_results.merge!(["#{church.id}", "make"] => "Make: #{hit.highlight(:make).format { |fragment| "<strong>#{fragment}</strong>" }}")
          end
          hit.highlights(:background).each do |highlight|
            church_results.merge!(["#{church.id}", "background"] => "<q>#{hit.highlight(:background).format { |fragment| "<strong>#{fragment}</strong>" }}</q>")
          end
        end

        artistic_value_results = {}
        artistic_value_search.each_hit_with_result do |hit, artistic_value|
          if !artistic_value_results.key?(["#{artistic_value.church_id}","artistic_value"])
            artistic_value_results.merge!(["#{artistic_value.church_id}", "artistic_value"] => "<q>#{hit.highlight(:description).format { |fragment| "<strong>#{fragment}</strong>" }}</q>")
          end
        end

        fact_results = {}
        fact_search.each_hit_with_result do |hit, fact|
          if !fact_results.key?(["#{fact.church_id}","fact"])
            fact_results.merge!(["#{fact.church_id}", "fact"] => "<q>#{hit.highlight(:description).format { |fragment| "<strong>#{fragment}</strong>" }}</q>")
          end
        end

        timeline_point_results = {}
        timeline_point_search.each_hit_with_result do |hit, timeline_point|
          if !timeline_point_results.key?(["#{timeline_point.church_id}","timeline_point"])
            timeline_point_results.merge!(["#{timeline_point.church_id}", "timeline_point"] => "<q>#{hit.highlight(:description).format { |fragment| "<strong>#{fragment}</strong>" }}</q>")
          end
        end

        @final_results = church_results.merge(artistic_value_results).merge(fact_results).merge(timeline_point_results)
        @count = @final_results.group_by{ |key,value| key[0] }.count
        
        #     #:max_snippets => 3, 
        #   end
        #   order_by(:score, :asc)

      end
    end

end
