# frozen_string_literal: true

require 'sinatra'

post '*' do
  send_file 'Showcharity/API/SearchCharitiesV1/SearchCharitiesV1.asmx'
end
