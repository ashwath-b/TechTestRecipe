require 'pagy/extras/metadata'
require 'pagy/extras/array'

Pagy::DEFAULT[:items] = ENV['PER_PAGE'] || 10
Pagy::DEFAULT[:metadata] = %i[first_url next_url last_url pages]