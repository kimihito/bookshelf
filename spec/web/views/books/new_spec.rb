require 'spec_helper'
require_relative '../../../../apps/web/views/books/new'

class NewBookParams < Hanami::Action::Params
  params do
    required(:book).schema do
      required(:title).filled(:str?)
      required(:url).filled(:str?)
      required(:status).filled(:str?, included_in?: Book::VALID_STATUSES.values)
    end
  end
end

describe Web::Views::Books::New do
  let(:params) { NewBookParams.new(book: {}) }
  let(:exposures) { Hash[params: params] }
  let(:template)  { Hanami::View::Template.new('apps/web/templates/books/new.html.slim') }
  let(:view)      { Web::Views::Books::New.new(template, exposures) }
  let(:rendered)  { view.render }

  it 'displays list of errors when parmas contains errors' do
    params.valid? # trigger validations

    rendered.must_include('There was a problem with your submission')
    rendered.must_include('Title is missing')
    rendered.must_include('Url is missing')
    rendered.must_include('Status is missing')
  end
end
