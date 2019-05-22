module CategoriesHelper
    def current_page?(status)
        if params[:status] == status
           return "active"
        end
    end
end
