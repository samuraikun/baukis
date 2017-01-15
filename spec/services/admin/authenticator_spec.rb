require 'spec_helper'

describe Admin::Authenticator do
  describe "#authenticate" do
    let(:administrator) { build(:administrator) }
    let(:authenticator) { Admin::Authenticator.new(administrator) }

    shared_examples 'ログインの条件を満たすので、trueを返す' do
      # FIX_ME Mock化しなくちゃ
      it { expect(authenticator.authenticate(password)).to be_truthy }
    end

    shared_examples 'ログインの条件を満たさないので、falseを返す' do
      # FIX_ME Mock化しなくちゃ
      it { expect(authenticator.authenticate(password)).to be_falsey }
    end

    context "パスワードが正しいとき" do
      let(:password) { 'foobar' }

      it_behaves_like 'ログインの条件を満たすので、trueを返す'
    end

    context "パスワードが間違っているとき" do
      let(:password) { 'xy' }

      it_behaves_like 'ログインの条件を満たさないので、falseを返す'
    end

    context "パスワードが入力されていないとき" do
      let(:administrator) { build(:administrator, password: nil) }
      let(:password) { nil }

      it_behaves_like 'ログインの条件を満たさないので、falseを返す'
    end

    context "アカウント停止中のユーザーのとき" do
      let(:administrator) { build(:administrator, suspended: true) }
      let(:password) { 'foobar' }

      it_behaves_like 'ログインの条件を満たさないので、falseを返す'
    end
  end
end
