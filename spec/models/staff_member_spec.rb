require 'rails_helper'

RSpec.describe StaffMember, type: :model do
  describe "#password=" do
    let(:member) { create(:staff_member) }

    context 'パスワードの文字列が存在するとき' do
      before do
        member.password = 'baukis'
      end

      specify '文字列を与えると、hashed_passwordは長さ60の文字列になる' do
        expect(member.hashed_password).to be_kind_of(String)
        expect(member.hashed_password.size).to eq(60)
      end

      context 'パスワードの文字列が存在しないとき' do
        specify 'nilを与えると、hashed_passwordはnilになる' do
          member = StaffMember.new(hashed_password: 'x')
          member.password = nil

          expect(member.hashed_password).to be_nil
        end
      end
    end
  end
end
