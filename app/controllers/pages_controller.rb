class PagesController < ApplicationController
  before_action :set_query, only: [:search, :results]
  def login
  end

  def home
  end

  def about
  end

  def contact
  end

  def search
    if params['query'] != nil 
      if @churches.count != 0
        redirect_to results_path(:query => @query)
      else
        @message = "Sorry, we couldn't find what you searched for."
      end
    else
      render :search
    end
  end

  def results
  end

  def suggest
  end

  private
    def set_query
      @query = params['query']
      if @query != nil
        @churches = Church.where(['name LIKE ? OR location LIKE ? OR background LIKE ? OR architecture LIKE ? OR make LIKE ? OR id IN (SELECT church_id FROM artistic_values WHERE description LIKE ?) OR id IN (SELECT church_id FROM facts WHERE description LIKE ?) OR id IN (SELECT church_id FROM timeline_points WHERE description LIKE ?)',"%#{@query}%","%#{@query}%","%#{@query}%","%#{@query}%","%#{@query}%","%#{@query}%","%#{@query}%","%#{@query}%"])
      elsif @query == ""
        @churches = Church.all
      end
    end
end
