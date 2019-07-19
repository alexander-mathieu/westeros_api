class SearchController < ApplicationController
  def index
    render locals: {
      facade: SearchIndexFacade.new(params[:house])
    }
  end
end
