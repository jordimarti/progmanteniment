Rails.application.routes.draw do
  get 'operacions/import'
  get 'planificacions/fases', to: 'planificacions#fases', :as => :fases_planificacio
  get 'planificacions/calendari', to: 'planificacions#calendari', :as => :calendari
  resources :arxiu_millores
  resources :arxiu_correctius
  resources :arxiu_preventius
  resources :preventius
  resources :tresoreries
  resources :ingressos
  resources :derrames
  resources :planificacions
  resources :operacions do
    collection do
      get :assignacions
      put :assigna
    end
  end
  resources :identificacions
  resources :fases
  resources :edificis
  devise_for :users
  get 'home/index'
  get 'home/contacta'
  get 'home/document', to: 'home#document', :as => :document
  root :to => "home#index"
end
