# Configure your routes here
# See: https://guides.hanamirb.org/routing/overview
#
# Example:
# get '/hello', to: ->(env) { [200, {}, ['Hello from Hanami!']] }

root to: 'dictionary#index'
get '/words/new', to: 'words#new'
post '/words', to: 'words#create'
