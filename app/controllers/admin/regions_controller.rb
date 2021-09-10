class Admin::RegionsController < AdminController

  private

    def region_params
      params.require(:region).permit(:title, :country_details, :currency_details, :tax_details)
    end

end
