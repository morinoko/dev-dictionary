module Web
  module Controllers
    module Words
      class Create
        include Web::Action

        expose :word

        params do
          required(:word).schema do
            required(:en).filled(:str?)
            required(:ja).filled(:str?)
            required(:kana).filled(:str?)
            required(:romaji).filled(:str?)
          end
        end

        def call(params)
          if params.valid?
            @word = WordRepository.new.create(params[:word])

            redirect_to '/'
          else
            self.status = 422
          end
        end
      end
    end
  end
end
