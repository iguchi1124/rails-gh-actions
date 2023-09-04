require 'rails_helper'

describe 'Pages', type: :system do
  scenario 'get index' do
    visit '/'
  end
end
