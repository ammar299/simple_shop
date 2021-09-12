module Admin
  class Admin::RegionsController < AdminController
    before_action :set_region, only: %i[edit update destroy]

    def index
      @regions = Region.all
      render json: @regions
    end

    def create
      @region = Region.new region_params

      if @region.save
        render json: @region

      else
        render json: @region.errors.full_messages.join("\n")
      end
    end

    def update
      if @region.update region_params
        render json: @region

      else
        render json: @region.errors.full_messages.join("\n")
      end
    end

    def destroy
      if @region.destroy
        render json: 'Region destroy successfully!'

      else
        render json: 'Unable to delete region!'
      end
    end

    private

    def set_region
      @region = Region.find params[:id]
    end

    def region_params
      params.require(:region).permit(:title, :country_details, :currency_details, :tax_details)
    end
  end
end
