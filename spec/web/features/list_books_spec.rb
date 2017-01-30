require 'features_helper'

describe 'List books' do
  let(:repository) { BookRepository.new }
  before do
    repository.clear
    repository.create(title: 'PoEAA', url: ' http://amzn.asia/7pl7FYP')
    repository.create(title: 'TDD', url: 'http://amzn.asia/cjh0v8Q')
  end
  it 'displays each book on the page' do
    visit '/books'

    within '#books' do
      assert page.has_css?('.book', count: 2), 'Expected to find 2 books'
    end
  end
end
