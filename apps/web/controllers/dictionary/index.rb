module Web
  module Controllers
    module Dictionary
      class Index
        include Web::Action

        expose :words

        def call(params)
          @words = WordRepository.new.all
        end
      end
    end
  end
end
