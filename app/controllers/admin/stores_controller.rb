module Admin
  class StoresController < AdminController

    def index

    end

    private

      def store_params
        params.require(:store).permit(:name)
      end

  end
end
