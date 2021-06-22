require 'rails_helper'

  describe 'トップ画面(root_path)のテスト' do
    before do
      visit root_path
    end
    context '表示の確認' do
      it 'root_pathが"/"であるか' do
        expect(current_path).to eq '/'
      end
    end
  end

describe "ログイン後のトップページの確認" do
  before do
    visit posts_path
  end
  context '表示の確認' do
    it 'posts_pathが"/posts_path"であるか' do
      expect(current_path).to eq('/posts')
    end
  end
end

  describe "投稿画面(new_post_path)のテスト" do
    before do
      visit new_post_path
    end
    context '表示の確認' do
      it 'new_post_pathが"/posts/new"であるか' do
        expect(current_path).to eq('/posts/new')
      end
    end
  end