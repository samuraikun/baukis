require 'spec_helper'

describe Staff::Authenticator do
  describe "#authenticate" do
    let(:staff_member) { build(:staff_member) }
    let(:authenticator) { Staff::Authenticator.new(staff_member) }

    shared_examples 'ログインの条件を満たすので、trueを返す' do
      # FIX_ME Mock化しなくちゃ
      it { expect(authenticator.authenticate(password)).to be_truthy }
    end

    shared_examples 'ログインの条件を満たさないので、falseを返す' do
      # FIX_ME Mock化しなくちゃ
      it { expect(authenticator.authenticate(password)).to be_falsey }
    end

    context "パスワードが正しいとき" do
      let(:password) { 'pw' }

      it_behaves_like 'ログインの条件を満たすので、trueを返す'
    end

    context "パスワードが間違っているとき" do
      let(:password) { 'xy' }

      it_behaves_like 'ログインの条件を満たさないので、falseを返す'
    end

    context "パスワードが入力されていないとき" do
      let(:staff_member) { build(:staff_member, password: nil) }
      let(:password) { nil }

      it_behaves_like 'ログインの条件を満たさないので、falseを返す'
    end

    context "アカウント停止中のユーザーのとき" do
      let(:staff_member) { build(:staff_member, suspended: true) }
      let(:password) { 'pw' }

      it_behaves_like 'ログインの条件を満たさないので、falseを返す'
    end

    context "ログイン開始前のとき" do
      let(:staff_member) { build(:staff_member, start_date: Date.tomorrow) }
      let(:password) { 'pw' }

      it_behaves_like 'ログインの条件を満たさないので、falseを返す'
    end

    context "ログアウトしたとき" do
      let(:staff_member) { build(:staff_member, end_date: Date.today) }
      let(:password) { 'pw' }

      it_behaves_like 'ログインの条件を満たさないので、falseを返す'
    end
  end
end
