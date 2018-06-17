# frozen_string_literal: true

RSpec.configure do |config|
  config.expect_with :rspec do |expectations|
    expectations.syntax = :expect
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end

  config.mock_with :rspec do |mocks|
    mocks.verify_partial_doubles = true
  end

  config.shared_context_metadata_behavior = :apply_to_host_groups

  config.example_status_persistence_file_path = '.rspec_status'
  config.disable_monkey_patching!
  config.default_formatter = 'doc' if config.files_to_run.one?
  config.order = :random
  Kernel.srand config.seed

  # config.filter_run_when_matching(:focus)
  # config.filter_run(focus: true)
  # config.filter_run_excluding(block: nil)
  config.run_all_when_everything_filtered = true

  config.disable_monkey_patching!

  config.warnings = false
  config.profile_examples = ENV.fetch('PROFILE', 0)
  config.order = :random
end

# rubocop:disable Naming/UncommunicativeMethodParamName
# Silence output from pending examples
module FormatterOverrides
  def example_pending(_); end

  def dump_pending(_); end
end

RSpec::Core::Formatters::DocumentationFormatter.prepend(FormatterOverrides)
RSpec::Core::Formatters::ProgressFormatter.prepend(FormatterOverrides)
# rubocop:enable Naming/UncommunicativeMethodParamName
