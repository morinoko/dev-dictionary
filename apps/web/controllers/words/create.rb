module Web
  module Controllers
    module Words
      class Create
        include Web::Action

        def call(params)
          WordRepository.new.create(params[:word])

          redirect_to '/'
        end
      end
    end
  end
end
