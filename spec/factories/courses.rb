FactoryBot.define do
  factory :course do
    title { 'Aesthetics of Chinese Plates' }
    candidate
    description { 'My String' }
    certificate_link { 'google.com' }
  end
end
