class PagesController < ApplicationController
  before_action :set_query, only: [:search, :results]

  def search
    if params['query'] != nil
      if @churches.count == 0
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

  private
    def set_query
      if params['query'] != nil
        @search = Church.search do 
          fulltext params['query'] do 
            highlight :background
            highlight :artistic_values
          end
          order_by(:score, :asc)
        end
        @churches = @search.results
      end
    end

end
