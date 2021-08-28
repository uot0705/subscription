require 'rails_helper'

RSpec.describe ThanxMailer, type: :mailer do
  describe 'complete_registration' do
    let(:mail) { ThanxMailer.complete_registration }

    it 'renders the headers' do
      expect(mail.subject).to eq('Complete registration')
      expect(mail.to).to eq(['to@example.org'])
      expect(mail.from).to eq(['from@example.com'])
    end

    it 'renders the body' do
      expect(mail.body.encoded).to match('Hi')
    end
  end
end
