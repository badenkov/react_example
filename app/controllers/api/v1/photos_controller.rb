class Api::V1::PhotosController < Api::V1::ApplicationController
  def search
    @response = FlickrAdapter.search_photos_async(params[:query])

    render json: @response
  end
end
