module Web
  module Views
    module Words
      class Edit
        include Web::View

        def form
          Form.new(:word, 
                   routes.word_path(id: word.id),
                   {word: word},
                   {method: :patch})
        end
      end
    end
  end
end
