Rails.application.routes.draw do
  namespace 'api' do
    namespace 'v1' do
      resources :fighters
      resources :competitions
    end
  end
end
