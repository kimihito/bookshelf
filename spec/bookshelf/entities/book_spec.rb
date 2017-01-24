require 'spec_helper'

describe Book do
  # place your tests here
  it 'can be initialised with attributes' do
    book = Book.new(title: 'Refactoring')
    book.title.must_equal 'Refactoring'
  end
end
