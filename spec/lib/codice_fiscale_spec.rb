require 'spec_helper'

describe CodiceFiscale do
  describe '#calculate' do
    let(:mario_attributes) { {:name => 'mario', :surname => 'rossi', :gender => :male, :birthdate => Date.new(1987, 1, 1),
                              :province_code => 'lc', :city_name => 'Abbadia Lariana'} }

    before do
      subject.config.city_code = nil
      subject.config.country_code = nil
    end

    it 'returns the expected code' do
      expect(subject.calculate(mario_attributes)).to eq 'RSSMRA87A01A005V'
    end

    context 'when params are not valid' do
      let(:invalid_attributes) { mario_attributes.merge(:name => '') }

      it 'raises an error' do
        expect { subject.calculate(invalid_attributes) }.to raise_error(ArgumentError)
      end
    end
  end
end