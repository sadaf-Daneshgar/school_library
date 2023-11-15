require_relative '../Library/trimmer_decorator'
require 'rspec'

describe TrimmerDecorator do
  let(:nameable_instance) do
    Class.new do
      def correct_name
        'LongNameMoreThanTenChars'
      end
    end.new
  end

  let(:trimmer_decorator_instance) { TrimmerDecorator.new(nameable_instance) }

  it 'trims the name to 10 characters when it is longer than 10 characters' do
    expect(trimmer_decorator_instance.correct_name.length).to eq(10)
  end

  it 'does not trim the name when it is not longer than 10 characters' do
    allow(nameable_instance).to receive(:correct_name).and_return('ShortName')
    expect(trimmer_decorator_instance.correct_name).to eq('ShortName')
  end
end
