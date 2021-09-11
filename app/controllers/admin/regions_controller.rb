module Admin
  class Admin::RegionsController < AdminController
    before_action :set_region, only: %i[edit update destroy]

    def create
      @region = Region.new region_params

      if @region.save
        flash['success'] = 'Region has been added successfully!'

      else
        flash['error'] = @region.errors.full_messages.join("\n")
      end
    end

    def update
      if @region.update region_params
        flash['success'] = 'Region has been updated successfully!'

      else
        flash['error'] = @region.errors.full_messages.join("\n")
      end
    end

    def destroy
      if @region.destroy
        flash['success'] = 'Region has been deleted successfully!'

      else
        flash['error'] = 'Unable to delete region!'
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
