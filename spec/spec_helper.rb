require 'rspec'
require 'pg'
require 'pry'

DB = PG.connect({:dbname => 'doctors_office_test'})

RSpec.configure do |config|
  config.after (:each) do
    #DB.exec("DELETE FROM albums *;")
    #DB.exec("DELETE FROM songs *;")
    #DB.exec("DELETE FROM artists *;")
  end
end