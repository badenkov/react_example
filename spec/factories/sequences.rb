FactoryGirl.define do
  sequence :title do |n|
    "title_#{n}"
  end

  sequence :url do |n|
    "http://example_#{n}.com"
  end
end
