Rails.application.routes.draw do
  namespace 'api' do
    namespace 'v1' do
      resources :fighters
      resources :competitions
      resources :rankings
    end
  end
end
