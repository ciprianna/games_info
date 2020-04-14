Rails.application.routes.draw do
	root to: "welcome#index"
	namespace :api do
		resources :games do
			member do
				put "console_assocations", to: "games#console_assocations"
			end
		end
		resources :consoles
	end
	resources :game_consoles, only: %i[create new destroy]
end
