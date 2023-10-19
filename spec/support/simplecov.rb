# frozen_string_literal: true

require 'simplecov'
require 'active_support/inflector'

if ENV['coverage']
  require 'simplecov'

  SimpleCov.start 'rails' do
    enable_coverage :branch

    add_filter '/config/'
    add_filter '/factories/'
    add_filter '/features/'
    add_filter '/initializers/'
    add_filter '/spec/'
    add_filter '/helpers/'

    add_group 'Lib', 'lib'

    Dir['app/*'].each do |dir|
      add_group File.basename(dir).humanize, dir
    end

    # If running test in CI, generate just .json result, then we can join them later
    # else, generate the full HTML report
    if ENV['CI']
      # Disambiguates individual test runs with CIRCLE_NODE_INDEX
      command_name "Job #{ENV['CIRCLE_NODE_INDEX']}" if ENV['CIRCLE_NODE_INDEX']

      formatter SimpleCov::Formatter::SimpleFormatter
    else
      formatter SimpleCov::Formatter::MultiFormatter.new(
        [
          SimpleCov::Formatter::SimpleFormatter,
          SimpleCov::Formatter::HTMLFormatter
        ]
      )
    end
  end
end
