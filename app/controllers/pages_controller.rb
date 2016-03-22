class PagesController < ApplicationController
  before_action :set_query, only: [:search, :results]

  def search
    if @query != nil
      if @query.strip.empty?
        @message = "No search query"
      elsif @results.count == 0
        @message = "Sorry, we couldn't find what you searched for."
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

  def submit
    @church = params['radio_church']
    @category = params['radio_category']
    @suggestion = params['suggestion']
    ActiveRecord::Base.connection.execute("INSERT INTO suggestions (church,category,suggestion) VALUES ('#{@church}','#{@category}','#{@suggestion}')")
  end

  private
    def set_query
      @query = params['query']
      @results = Church.search(@query)
    end

end
