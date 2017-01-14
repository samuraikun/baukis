require 'rails_helper'

RSpec.describe Administrator, type: :model do
  describe "#password=" do
    let(:administrator) { create(:administrator) }

    context 'パスワードの文字列が存在するとき' do
      before do
        administrator.password = 'foobar'
      end

      specify '文字列を与えると、hashed_passwordは長さ60の文字列になる' do
        expect(administrator.hashed_password).to be_kind_of(String)
        expect(administrator.hashed_password.size).to eq(60)
      end

      context 'パスワードの文字列が存在しないとき' do
        specify 'nilを与えると、hashed_passwordはnilになる' do
          administrator = Administrator.new(hashed_password: 'x')
          administrator.password = nil

          expect(administrator.hashed_password).to be_nil
        end
      end
    end
  end
end
