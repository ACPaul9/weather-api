Rails.application.routes.draw do
  resource :weather, controller: :weather, only: [] do
    get :current
    get :by_time
    nested do
      scope :historical, as: :historical do
        get :min
        get :max
        get :avg
      end
    end
  end

  get :health, controller: :status
end
