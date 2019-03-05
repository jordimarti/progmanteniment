Rails.application.routes.draw do
  resources :referencia_calendari_operacions
  resources :referencia_calendari_preventius
  resources :despeses
  get 'documents/index'


  get 'operacions/import'
  get 'operacions/calendari_preventiu'
  get 'operacions/calendari_actuacions'
  get 'planificacions/fases', to: 'planificacions#fases', :as => :fases_planificacio
  get 'planificacions/calendari', to: 'planificacions#calendari', :as => :calendari
  get 'planificacions/crea_valors_inicials', to: 'planificacions#crea_valors_inicials', :as => :crea_valors_inicials
  resources :arxiu_millores
  resources :arxiu_correctius
  resources :arxiu_preventius
  resources :preventius
  resources :tresoreries
  resources :ingressos
  resources :planificacions
  resources :operacions do
    collection do
      get :assignacions
      put :assigna
    end
  end
  resources :identificacions
  resources :fases
  resources :edificis do
    resource :download, only: [:show]
    resource :download_resum, only: [:show]
    resource :download_registre, only: [:show]
  end
  devise_for :users
  get 'pagaments/cambra_projects'
  get 'home/index'
  get 'home/contacta'
  get 'home/tutorial'
  root :to => "home#index"
end
