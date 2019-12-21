module Web
  module Controllers
    module Words
      class Edit
        include Web::Action

        expose :word

        def call(params)
          @word = WordRepository.new.find(params[:id])
        end
      end
    end
  end
end
