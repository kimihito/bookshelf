module Web::Controllers::Books
  class Create
    include Web::Action

    expose :book

    params do
      required(:book).schema do
        required(:title).filled(:str?)
        required(:url).filled(:str?)
        required(:status).filled(:str?, included_in?: Book::VALID_STATUSES.values)
      end
    end

    def call(params)
      if params.valid?
        @book = BookRepository.new.create(params[:book])

        redirect_to routes.books_path
      else
        self.status = 422
      end
    end
  end
end
