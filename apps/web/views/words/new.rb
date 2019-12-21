module Web
  module Views
    module Words
      class New
        include Web::View

        def form
          Form.new(:word, 
                   routes.words_path)
        end
      end
    end
  end
end
